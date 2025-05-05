Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0B925C70B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746457911; cv=none; b=EQpGKnSz8D9u6iIIH4TIbQLSm8PzOcVbI7oQd15A+TLLqRQqJQoUGufhrdzW4Gae+dRvTOL8Lf3hoUuBjQkbBR2FlV1V3nhZfP4LFjB4+JrGub7vSZZS3rvPqOK8STQLTQEG7blyBzZrysvblU4pjQrY5Axte2Vmo0C3VBELqlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746457911; c=relaxed/simple;
	bh=J7f5rkEnnZyDN/Zxk28ty3f8ryplNKQEreYL9blZdyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srdUhy9yDphKfkKdvh7VnvsFrPiOe7Fp1WBzwpY+9mvaDjLRDVKfViPmR44o0KEHpvsQ5Hg50b598qej4dSNlelkjAb8CY1Hnj25/3YtvclotO/bosgg9xARuVw9xdJkaZMNgaRTwIV0aKQY9crLY+5HkTootXED+Q8rAXvx6Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=amPLvqtq; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="amPLvqtq"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b0b2d1f2845so3161033a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 08:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746457909; x=1747062709; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7f5rkEnnZyDN/Zxk28ty3f8ryplNKQEreYL9blZdyc=;
        b=amPLvqtqwjpGoJht11+PudJJXzmgMHfEAYymQfcPnGodoM0gPDnlMk69FoHETEbTO+
         Z2ov+UcZ0lvNeVUSd/+wjwP9JjmkGy17yvcU3Yuc+Ov9UDIy7v3Xfjy7+mOALe3Rq0am
         KrMRhlzJ3UXAWKhnCkbUi4BsK3DbVohufA+efn8suPUwqyNkdWStmeea5U2YhbloXi2t
         tey69mOzfv1wFlPNB+6NMnzISKpGGKlkZapmk8pXV66iu+EEvCFY511Ceop4e0fqZbRi
         A2DGelyrciy8UlYkk+mUWr517RbS5ZhrzIvH0fhztLmvSbIjVb0FwWJU1fPgOVUdNF6i
         fvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746457909; x=1747062709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7f5rkEnnZyDN/Zxk28ty3f8ryplNKQEreYL9blZdyc=;
        b=OQpfJ3m/AfNBzyRrnW9rUvPReE6YUc5/fjt/TC6Zj1jdMzQ4113tkCwIlbbuCsVcF2
         ZNIH/Ap7rKVcCA5WOHkK301pFM4ESRTY5EdOm52DF5sehBPXrC4XYBVUNidHgsz93uLj
         Q9LyWcgzzfMf/c+Do+tJOGVY538Tglhhsersff/RjaX8vYI66AWn5aNSUmFcuzBbk+u6
         sr/iWnb9+mmLydsa4cZ1yu+VPWJzNIe1biOdn9bJstEPT6xQp692mJIetZWnq6zjmZyj
         SxiKCNm0WdW4vjuPTZTI229uivehViJ0vDRr0PkKLLKnxQQLrIIXE1PZ6weMA9znqpIn
         Jw5A==
X-Forwarded-Encrypted: i=1; AJvYcCUEqq9dAh39i7Ur/i8dVSz+dnlVXoK/SPSIoKCbn52ORXZ3SUHyHJW21/RYgur3fkhAjyIIPenKWEgdey4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI3aku6xOCk33IFIf/OR9HecNC67Z+5/AqZxH3W0SyrUIUVDJX
	HkZ9+XDtpYiC0xgtpWisKZrskU2VdNsrdB2J60Irda78eVsEzu8TPZAjyxzJjPzp6f/DApJprkA
	VCY6cXRSQiaUKbt44/IPBGT7arvVI1/1Lu+Lt
X-Gm-Gg: ASbGncuQVPSkGlhHg8yuwJoD2sjiW26Yt9FeIVm0OZR2NuGqyYiYvx3i6MxfZqUbgsj
	T1C1juKqC2YHuUAjPHCEnajvLAcXzkdndNDuWLkij88xZnvxxpYEePHRlzWnsd0st/4zXgWmbyO
	sXqZiVEU8xwILYVFItMTza1Q==
X-Google-Smtp-Source: AGHT+IF/DN6Mb9AnQZSO+fGnheiV824IrRTiAYVdybT75nlNooUcBVhmYSMHE5y4Sw6N4a0GayQHjT56d1cqp8glrlQ=
X-Received: by 2002:a17:90b:2dc4:b0:2fe:955d:cdb1 with SMTP id
 98e67ed59e1d1-30a4e624af3mr15635710a91.23.1746457908793; Mon, 05 May 2025
 08:11:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505141238.4179623-1-aik@amd.com> <20250505141238.4179623-2-aik@amd.com>
In-Reply-To: <20250505141238.4179623-2-aik@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 5 May 2025 08:11:35 -0700
X-Gm-Features: ATxdqUGOVLxznNhA7kpNkep_TQimeP0WJO4XqfH67iHU61-gZrKrUYMm-ZJZ5rE
Message-ID: <CAAH4kHY0NcG8n-CKWjYPSeJf0YxF+D_pycAXTUDza1E-Qy2v0A@mail.gmail.com>
Subject: Re: [PATCH 1/4] virt: sev-guest: Contain snp_guest_request_ioctl in sev-guest
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

On Mon, May 5, 2025 at 7:13=E2=80=AFAM Alexey Kardashevskiy <aik@amd.com> w=
rote:
>
> SNP Guest Request only uses exitinfo2 which is a return value from GHCB,
> has meaning beyond ioctl and therefore belongs to snp_guest_req.
>
> Move exitinfo2 to snp_guest_req, remove snp_guest_request_ioctl from
> the SEV platform code.
>
> No functional change intended.
>
> Signed-off-by: Alexey Kardashevskiy <aik@amd.com>

Reviewed-by: Dionna Glaze <dionnaglaze@google.com>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
