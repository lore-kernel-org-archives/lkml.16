Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D53080B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 05:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743486373; cv=none; b=l56Io0tlPMTzhe6A1whZOT1O5SX9Vl3FjxtOZW86vr9K21HcMal77HMa5mTaBzwKb0D4fULuWolw/uGrhYDUtqyeOPIGStytb1AdYaYAKnx6kYrHdwJE1tNwKMmWaJc8m7nyGhGO4DbjAjhts6QJLt3RUcmupI1UAjAO5muDIxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743486373; c=relaxed/simple;
	bh=UO6J4lXlIL+xQ8vawMaEoX/yxhn4Vj44S9MBhDMToH4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=r8E8WJzszxzRxclrnrLtvcI9MaF4/vcvhYxDgZ8lJizic0suW9haVlqvS8w7cobxZ5prKAFG7QQHBk/k+oao7OE40ifmpoDecInwB2mvvjzRNY2yDonA2TJHgiWmeJzsrJFK5LHlpc03JvHILTloRRmwBjMn4McavgZfX4eMj20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=P9hSYgpx; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="P9hSYgpx"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5315jhoc3583643
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 31 Mar 2025 22:45:43 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5315jhoc3583643
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743486345;
	bh=JaR/7JLHc8AQjclGF7cvNDo49+pIVaq/eIbhSbpniKo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=P9hSYgpxE4qVpESXuwSH3VSNUK6p44vf+8ihs6AHvjG05nl73nvfF36jD0dGjJ7Yp
	 mhBVvdSXNOdPZtNF0NZi027nQKaSXwIpPiVXtLpirnS469zHgfM4wyFLewTAX+oXQO
	 zLLGp6Ap7EE0PjGiTAkYLNh4qkK7LVMpPDYY/mmx0FT3eLONU+AghwqivWMY9jommB
	 V5aMBn+Uihg1N88yT79Ph/VYIoYNTzhpxpYmFaeSqUTPOIOvi54xX9UdUUmWNE+nR5
	 Kv7Ai3A8F8zf+XniQMPQjCG/mXxcTSeKM5g4s4GRYLrIrJUBxVoVMAykkD3kcmQDg3
	 sSSKTRX94uxIg==
Date: Mon, 31 Mar 2025 22:45:41 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: "Huang, Kai" <kai.huang@intel.com>, "Mehta, Sohil" <sohil.mehta@intel.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "x86@kernel.org" <x86@kernel.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "bp@alien8.de" <bp@alien8.de>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
        "rppt@kernel.org" <rppt@kernel.org>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "jpoimboe@kernel.org" <jpoimboe@kernel.org>,
        "pmladek@suse.com" <pmladek@suse.com>, "xin@zytor.com" <xin@zytor.com>,
        "Luck, Tony" <tony.luck@intel.com>
Subject: Re: [PATCH 5/9] x86/nmi: Fix comment in unknown NMI handling
User-Agent: K-9 Mail for Android
In-Reply-To: <4e7937e946d94d5f62ff1a5f3b416f7d1eb2c71f.camel@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com> <20250327234629.3953536-6-sohil.mehta@intel.com> <4e7937e946d94d5f62ff1a5f3b416f7d1eb2c71f.camel@intel.com>
Message-ID: <BF35DF73-974C-4C8F-8ECE-3C9C254BAD1C@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 31, 2025 5:17:55 PM PDT, "Huang, Kai" <kai=2Ehuang@intel=2Ecom> wr=
ote:
>On Thu, 2025-03-27 at 23:46 +0000, Mehta, Sohil wrote:
>> The comment in unknown NMI handling is incorrect and misleading=2E Ther=
e
>> is no longer a restriction on having a single Unknown NMI handler=2E Al=
so,
>> nmi_handle() does not use the 'b2b' parameter anymore=2E
>>=20
>> The changes that made the comment outdated are:
>>=20
>> commit 0d443b70cc92 ("x86/platform: Remove warning message for duplicat=
e
>> NMI handlers")
>>=20
>> commit bf9f2ee28d47 ("x86/nmi: Remove the 'b2b' parameter from
>> nmi_handle()")
>
>After some digging, IIUC, the 'b2b' parameter of the nmi_handle() was act=
ually
>never used when it was originally added in the=20
>
>  commit b227e23399dc ("x86, nmi: Add in logic to handle multiple events =
and
>unknown NMIs")
>
>=2E=2E, so IIUC the comment was wrong when it was firstly added=2E =C2=A0
>
>The above commit to remove the 'b2b' seems just a fixup patch but it didn=
't fix
>the comment=2E
>
>Not sure whether it is worth to mention in the changelog=2E
>
>>=20
>> Remove the old comment and update it to reflect the current intention=
=2E
>>=20
>> Signed-off-by: Sohil Mehta <sohil=2Emehta@intel=2Ecom>
>>=20
>
>Anyway:
>
>Reviewed-by: Kai Huang <kai=2Ehuang@intel=2Ecom>
>

Ha! Any idea what it was *supposed* to do? I'm guessing it stood for "back=
 to back" or some such?
