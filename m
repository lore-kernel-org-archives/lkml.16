Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAFE25D21A
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 15:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746458386; cv=none; b=r45+ocHeeBFXGhajMKtSNJZuxa8Y3sF5gYBeUXnQjSIplTCa3fOKUQyKRVmxKXErQMAv9zb85szrvPeQ5dbI8QwPjX810UjRwzakO1eTCx7lgCKk7+JfFsOIv50KQiM6uZ3gP2tk75yEvWFy9zQdaLlgNWAcAXiUMK95glBxAR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746458386; c=relaxed/simple;
	bh=By+BSIHYmPwQ3NXvgXD1/pP14fq+7c6YHfA2fgRYzvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1PgVJdn4+X8/gUOSCCYf+2N7WUE6X+zC+7QHCv/WpEbqoHHiPIowG+owYhZ1m7HZ9ZxzT/Xx816799Iip5nYYgMko9NtqewfHUU6OzBuqa0wiHL2IAkQK8ZkLnyVhWA0EmAzDfO1HBysjFJ7zY3gjZWZP7ADvxej+b+0mKkVTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OdaTUSzf; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OdaTUSzf"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af51596da56so3321602a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 08:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746458384; x=1747063184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=By+BSIHYmPwQ3NXvgXD1/pP14fq+7c6YHfA2fgRYzvI=;
        b=OdaTUSzfW2781OrxJw8uJQDiIQ9qj71JtYxiNwGLnWyu9cijQgRIs1KVp9KCEe1zQm
         GwFZN460zKS0JTBtzZ1xtG/eKi+t7kEpFvpB3v7tyGK1rrFUyvm2D+8mwYKjqUEm2Lay
         OleaF2VHuG5VNScxNuIjWe3pkAO4BR1CwAyz0jPl9PXSTazuEUCimRWuYzXAz+GgvYNS
         E1KFQ+a9l8lWW2bN7GC5ivgYDukba/hDKd2/Yu8AeBFV8SeBM0a+Nus3fJ3UEQo3slTo
         u+PvxR3T2uFNVk9wMJKE31SegO6VBO3c5xK+IQRm1qCWD0wjXi2b42KMh20l4hu3mx3Q
         vFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746458384; x=1747063184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=By+BSIHYmPwQ3NXvgXD1/pP14fq+7c6YHfA2fgRYzvI=;
        b=HXfFJTTD1CUxhXMmLoiT6YWXZsr1iqX51CVH//ypVZn1QTLMi+bzuomcH0r5pwuWEg
         fB4ERkMn7/ne+kOCyo72ENA4ND6uqhXgZgntkAqU10LZig1EZSPtuq0jVuMr6K3VLQJl
         G5x2kqmav+Qicjg/zzOB4Egqp9SJOZQgvMeiej+bmrq5B1RdFQzzrICxHB2vvrF5/aFH
         eK9M/poIb/PWxmU63w1YvU9bPdvCz6/U/eWbMp2otNJsXHXaCFjHocWXyX7M2qoZRNRa
         zC+M5UfZa3fI4cVfRzuBfTlGx/72NNtIyscaJ/j5sjvnAjc4ozeEZZBHvbHtv9+huHys
         UuBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhWhzLdAzoA/KR6oMD2oIrdiFWafGYTpTxwvlemw7JktL05r4HE5W8gtifCwAdG1wV9EhoqPriKuZxkLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkhCzMShpb37biy5+Awc8EoNRdC8NbeOhUDUs6cn6wjWcF/mpX
	mNsciV657CcMe2CZytw6SIyhAofL3t0hGOSHhT345LzA+Fjd5b/f2GCCFLbmYKJiKXI7wveBy3K
	KP0ECHurM3NZAqvcIe6rXJPMSbnERixETRCtl
X-Gm-Gg: ASbGncvu22epQU1p07/8vA54MPpnuc8D00NOualqorIw/yT4/orbZNXVfeNQJ9Kiadc
	GsfZ7xjRVYAeEA1uOGd4Rx+24DA9r0JA/a5n/zEwoLZcWAhYjt4shlOjqq0tXZlh3Rj6x7ea2Z6
	VPdAkBhFuVeWtikyHmPZuZL68vMAMdrMi0
X-Google-Smtp-Source: AGHT+IFZXPRp36e1WqyPoc6EMflwYBiQ2qs8a5g0O/kvZ1TqfeOi98ytDeC+S1gBd8YYPjOI7RJb3dldguz/Nk+nohQ=
X-Received: by 2002:a17:90a:e706:b0:306:b78a:e22d with SMTP id
 98e67ed59e1d1-30a619a1979mr11330884a91.20.1746458383692; Mon, 05 May 2025
 08:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505141238.4179623-1-aik@amd.com> <20250505141238.4179623-5-aik@amd.com>
In-Reply-To: <20250505141238.4179623-5-aik@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 5 May 2025 08:19:30 -0700
X-Gm-Features: ATxdqUHN-wroTpoEDa07BabDmCq0sF0jdallikcqCL6vw-pOvr5JQinSdkJEEvk
Message-ID: <CAAH4kHbr+jw2jiC30+o7uqwo05f62FLN_7=TPGtFdW1Y9Bid6A@mail.gmail.com>
Subject: Re: [PATCH 4/4] x86/sev: Drop unnecessary parameter in snp_issue_guest_request
To: Alexey Kardashevskiy <aik@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Brijesh Singh <brijesh.singh@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Michael Roth <michael.roth@amd.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 7:14=E2=80=AFAM Alexey Kardashevskiy <aik@amd.com> w=
rote:
>
> Commit 3e385c0d6ce8 ("virt: sev-guest: Move SNP Guest Request data
> pages handling under snp_cmd_mutex")
>
> moved @input from snp_msg_desc to snp_guest_req which is passed to
> snp_issue_guest_request().
>
> Drop the extra parameter.
>
> No functional change intended.
>
> Signed-off-by: Alexey Kardashevskiy <aik@amd.com>

Reviewed-by: Dionna Glaze <dionnaglaze@google.com>



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
