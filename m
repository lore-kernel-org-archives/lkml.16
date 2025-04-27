Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130A07A13A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 00:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745714194; cv=none; b=LV/j6pxYFNFyl+THLafWwD3tdPMt6BwwvAeerrPJmpbYnQ1tiYkyCfbJQneUKo0NUSogC3N0KM+OjRsWu91wDu7QrCRqW7XxQWD41SYJP3O0Kp9AwSg1U9kbkNJHqDkDzqRSBXuDf50R+zNcUAtVL4F5vmDfuifITPOfpQsVXR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745714194; c=relaxed/simple;
	bh=TAE59HqMBIJ9xusLXDDuRw/AHzIt0tBcDF+6Jcomis8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=QUokV743AX2s07VbULBrT7HfSQCbiRIBMV7MYTIk0LgZnYB14zhbxSYzn3tgrqHWFrcdURNvbXZikm4kAioeTytGNXZGPn4iqm5dyhsEWwQ4hmSj3HXNtSFP28gGc9w6PIeLIN7/LOWp4v0nYo0VVRD2rPHczt+0APO4UWSu+8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=S7FC1CdY; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="S7FC1CdY"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53R0ZnmQ1060846
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sat, 26 Apr 2025 17:35:50 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53R0ZnmQ1060846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745714151;
	bh=3yZe2hwmc24kUcFIPymx5Z3oUOBzO0LqbFNLOvIXzcQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=S7FC1CdY6cRjbRwEytSeLDATwwZ9wHLvvhEP/3tnIoYX9BGQlEKGe613A1caGwRvt
	 6+HINA28B/YnRsab8Kf9inZDgIcZsXoao8j51TzojBKYRN7mLl5wRdGKqPLyDEpFnx
	 FB3y7GhVgFQZ/v7aD3HZ70bYoTPHrnLY0cK95Skkow1po1sywILbWT6PEUXCTM9atw
	 hhn06XFBM20uWiXGIX3F2q/m6JTPfZKf+JMN+X1YNnLjBDruDRXX8S21MNOzGCXPtX
	 e1ZVOmQ6k86hzTupEuOQmIoAuvbONE1l89BnoJVjEuCWIukSo3rEGrqRj5zekdX0W/
	 U7oCxHWmg2VRw==
Date: Sat, 26 Apr 2025 17:35:49 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ingo Molnar <mingo@kernel.org>
CC: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
User-Agent: K-9 Mail for Android
In-Reply-To: <aA0sNu0gcjlvhlDT@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com> <E130C6F4-5602-44E6-ABB0-B87B389C0026@zytor.com> <aA0sNu0gcjlvhlDT@gmail.com>
Message-ID: <74EAE03C-2316-4590-B0A8-83DB46B786DE@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 26, 2025 11:55:50 AM PDT, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>
>* H=2E Peter Anvin <hpa@zytor=2Ecom> wrote:
>
>> Dropping CMOV would mean dropping P5 support=2E
>
>Yeah, I think we should make the cutoff at the 686 level=2E Is there any=
=20
>strong reason not to do that? Stable kernels will still exist for a=20
>very long time for ancient boards=2E
>
>	Ingo

I don't think some of the embedded 586-level ISA CPUs are ancient=2E
