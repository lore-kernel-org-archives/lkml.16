Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A21315574E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 15:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746458000; cv=none; b=IHGDN/kISSX06iNyeoRrioovRsD7d2fJ6L6cibXjcMcARN2JHTlyiN7RsimGXa0cBb3pLkZJ3oBnBuWqWbIy/pqm6oOHhMEPfHYAezW4haPIvQDte8onOp0nhFDGeLR9wGpaQdwdDEwT0DvneBF2Tgc+uuI7+ErXXQbC1WHt520=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746458000; c=relaxed/simple;
	bh=JkWMdKtf92P10Lv3EQVC5r+5qoPP30yGbZBfGC5uOi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f1bUrcup3XfT6wsrLPgYL81ge8Y7qVHUoMYqsdgTQGYhJiDdENsZY6+Zcw5TyxW1+p4WGgsgaF5kujzFf7r39VPuGuC0le5HIFIBcTc1uIfaFRhczO3UAoV53psyrWFvI+YZ/nSugeGBTsyM2mDStI16aDqGZDSRAucuJC0rXik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FbAobK3q; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FbAobK3q"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so3704185b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 08:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746457996; x=1747062796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JkWMdKtf92P10Lv3EQVC5r+5qoPP30yGbZBfGC5uOi4=;
        b=FbAobK3q+AC+FqdaT+VGJj7/N1/2dv0T4EluFQynTHWLZ4eipNlh/Z50Hp1SiisPDv
         1oiUblBmbIRYafpxWWZmJI0vBvLQuvcLIe+Us4hjNqv8ulpYgpHtj3Ar/0ke+qV9q2yr
         /yvqnX/F4dlGj8P97RCpdxjXs98C4AmOae832xgSpoUlugnu6EGhAD7qiIckme8pncj+
         IstuuYDbLPTFjYSl6+72wz2He2TAg4A4hvgXhUh//UPVLZxXPAI3pK6XMdw48m6GGnJ8
         X+AVvyDfo0fmP8sGIIqa79GWyKwGNaCmEhuXmjXOtmPDtPhVFoEeXfQyoYvww4Z+UWn6
         pQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746457996; x=1747062796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkWMdKtf92P10Lv3EQVC5r+5qoPP30yGbZBfGC5uOi4=;
        b=OkTmrAkb8sjgs/JNnHCjrjcb8/2R/9GSXKEMymIKgkDYGeyqgPeOvhzGywB8OC/JAH
         CETTxzic/kk6Y0CzVEGHvAGEoJmiHXTWtEdxN1mZc0/Xke7npa9bC2Q355YonCbkBSTL
         e8dQgQOilM7iizMnSc4/08c7YoDJqfnM+QyrC+1PKGIhsVdHP3QiXzpDqYA3SIsu7L2f
         N1ZJAGQ/PEdzZOmu1vI/kk0WOx91BX+rxhKoMrt4l0FW6yc7BL2cgfCYidj/OSEOpScy
         5Y5lq9D1U/qKpu+t2deB5VjePjZIB+USSxP+RXfHivo352BOIn8qK2usvMulcMs90U/d
         nmew==
X-Forwarded-Encrypted: i=1; AJvYcCXbf30K2N4//E5/PvRh4ZQser9EQKxtbpmM+elavN4sYlbKgjDMQl97lEGlPtkM7bmNx6f2WJ62SBjcOA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY2rAZCqnyTJgdDBcVEm4zgE70sl5enuniSegD2R7fdZDkmdfa
	wyAX+ERzoVsJkvQzXoCvP7j3I9zTwfR6nb3xc0RzlZd3FdHVBrbLSnyOgfrPWVuKZqDpXwRD+w8
	H8esW7BzN1QcW27e6iYNfMebuZJgoIuQtZmxaeZRpAzwgaGSlNAxj
X-Gm-Gg: ASbGncu5c0zvHpgha63inJprOSPYIUOARYbA5/Qs8S5PnFmQWwvM637Ur1eS0nIAD2W
	4JRo4tqtkCXbvrJfbWwcr6y1PtCeLAcX9I7/jZ8Bk+j/bOfV2oaxXidwPKrMAO+BzMln+VnjeBl
	7KGDjOKGhSE+O2OcoT2gs+OA==
X-Google-Smtp-Source: AGHT+IEX+eK2HwraE/WERStR7Y4uH1ls3UErcCOKiV+sCb+p9IMOVpuegmVB+G0KUdV7lLI2Rky8yPhDUKbVe6dFbBc=
X-Received: by 2002:a17:90b:4ec7:b0:2ee:c6c8:d89f with SMTP id
 98e67ed59e1d1-30a5ae1ae18mr15753022a91.14.1746457996118; Mon, 05 May 2025
 08:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505141238.4179623-1-aik@amd.com> <20250505141238.4179623-3-aik@amd.com>
In-Reply-To: <20250505141238.4179623-3-aik@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 5 May 2025 08:13:03 -0700
X-Gm-Features: ATxdqUH-K4bFkhaHamy3SYBKi0X94IdvgpCUWWYgAtqQQ1Oj1ReG4kZPbxuVcng
Message-ID: <CAAH4kHb97oFRppJgFXHe_m24GYwsY6wW=mSpw692YX-urM6stQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] x86/sev: Allocate request in TSC_INFO_REQ on stack
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
> Allocate a 88 byte request structure on stack and skip needless
> kzalloc/kfree.
>
> While at this, correct indent.
>
> No functional change intended.
>
> Signed-off-by: Alexey Kardashevskiy <aik@amd.com>

Reviewed-by: Dionna Glaze <dionnaglaze@google.com>

--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
