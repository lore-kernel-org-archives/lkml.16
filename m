Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C781F09B8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743627860; cv=none; b=Tpy+BaYqcDubTG3Ew3lBN3R5JVNPsA7kClTGRNN3M68WUCftDevw1JLaezN9b3jOmJZzWJFlSVfJTEv4RatIaZO+fdI0S8GclXYMnLj1NsvSL/36i8SEPhlgZ8svC7eXLtGWH5HiK4nGWlzlNcokxw5ZrWjRYG6Fl2dgEJm/N8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743627860; c=relaxed/simple;
	bh=Vfw9nQys8I+huPyRWSgdNMgCg49GbaslzRnU36FYbkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m1ycAwRkAvBZFVlZ7jsv54LITHb5XAIjCVgnt098IDOcSg7CnVDjTPobcO+W2qKEnCdeqMUahmliz1e0sN8OCMy76c7/IJB8RoNkYQv8O5lzLx/Nu5g8CWe29bjW6odKRP/8UeY3A/rdHY8t3zJcpQalffrBqn9DCGnQOBJ2Ulc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fsykVB+f; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fsykVB+f"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-47681dba807so321881cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 14:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743627857; x=1744232657; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Noe3DDy0z2CTvHPr8zx/kBmGMiLW3dq2T/XCyIhCd/c=;
        b=fsykVB+fQQrVodOyZCmAMTbw6SxFQVFNRow6Qqbl+H9vBkT5ljnj4TkudcTQZcPlCr
         gggOGHPXkzNaYqqP++KvSPQySuU8XTlCAgmS+oqcvoNriMYlX3OiCo6OwdQI2KBSwK4i
         YyjgOEMOQ/yUT/wVKmpK5WvFY886M+Fr4aoJ3dWtxbpVh4vTbg5t9PEKNSgw3pppBNAW
         dG4DbRC7H+XWxc0aP5I0WtyhLLehLnwunK+Gua6sYQ+GSmkEdVfzuZZU74qqPLSq3c4c
         yjfC5sYVUBRGum4YVPPOCOSxJtXuCR71pvFJTfu91qQhCtyo7tEpJhGpRkgNFl9YVzSQ
         3GEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743627857; x=1744232657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Noe3DDy0z2CTvHPr8zx/kBmGMiLW3dq2T/XCyIhCd/c=;
        b=d9NcRK7xGvIuUrgRoXYtyiRAi5AhJUz7+j5X+W4bxS+loVoPvG2kC9oZq7otyby6HG
         LifSG+5soponb64iGEkq3qDkzPgVZHA0n2ck9CJ85zPW7tgs5QR4Ks+592j5lY9Rboar
         RhqiNYH+eIJpH4kwYD1dDVDjbtEX/K91s03k5PiaA7urps+s0RateCTCnUpZSxLe4Ri9
         3++h/qPVWIXMEWt5FFFyOp/2Y8uoKAR3MI+I4OS1YHVfw5B6/kk6txQBmNHp1MTJf9OH
         99QgxQl022AYDwdHPs1jlHO1uguf7m2TQ1pCqj9ySj8MB8pXc+wE2oMe5CrA20RBjTur
         Xq5w==
X-Forwarded-Encrypted: i=1; AJvYcCWI1E/scEJVIBlffU9TAAAymCdiC1czHczFzZm5C7mPXDLdltU/wkAL3hLmkCHZ2aCTSf4kEXzEJXmrDIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpMmqCviX7zbbwusrKkwAysASbUVgrgJvi4pQ3NhXWJpTe2xHg
	ixZmkac8nMITYa/xcqn1Mr5RkJCNYaAJpYP8fDRrWIdni/1HbbpgDCCQB+TA7P+T8ZmacE2FfcW
	0Z0/QuO/3siPpGwdbvENb5MZGUHBawnjTp1Zq
X-Gm-Gg: ASbGnctGcvFtVEx2V4TsX/QK6VZmxXR30JoEzXRkz/2/V/iWDEfpTToMJD+ZJW08ZB6
	lIZq+YH+TJbCKNxz8sTclAca69vG+VIvwQwNURdcPKU3TdMBTdx8aKuLI1iVG2zshnQkzSgaEde
	YTPoNZFUHHUZf+hcNxNHxIWzflKA==
X-Google-Smtp-Source: AGHT+IGYW45ozRLi9bL9GSKrmNMLBs0q1+I1SgbQECqY7JZ9X9Pt9sehBj/WRt88DS5jI5cwU1IS+pidai2+KcquPAs=
X-Received: by 2002:a05:622a:d3:b0:475:1410:2ca3 with SMTP id
 d75a77b69052e-47919304cd6mr262671cf.15.1743627856822; Wed, 02 Apr 2025
 14:04:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743617897.git.jpoimboe@kernel.org> <df47d38d252b5825bc86afaf0d021b016286bf06.1743617897.git.jpoimboe@kernel.org>
In-Reply-To: <df47d38d252b5825bc86afaf0d021b016286bf06.1743617897.git.jpoimboe@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 2 Apr 2025 14:04:04 -0700
X-Gm-Features: AQ5f1JqI2l-_CwD-vrjqsPSf1FBNCueZti99jXQWfPKo6ikElesqHD9eVL752cA
Message-ID: <CALMp9eTGU5edP8JsV59Sktc1_pE+MSyCXw7jFxPs6+kDKBW6iQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] x86/bugs: Use SBPB in __write_ibpb() if applicable
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, amit@kernel.org, 
	kvm@vger.kernel.org, amit.shah@amd.com, thomas.lendacky@amd.com, bp@alien8.de, 
	tglx@linutronix.de, peterz@infradead.org, pawan.kumar.gupta@linux.intel.com, 
	corbet@lwn.net, mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com, 
	seanjc@google.com, pbonzini@redhat.com, daniel.sneddon@linux.intel.com, 
	kai.huang@intel.com, sandipan.das@amd.com, boris.ostrovsky@oracle.com, 
	Babu.Moger@amd.com, david.kaplan@amd.com, dwmw@amazon.co.uk, 
	andrew.cooper3@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 11:20=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> __write_ibpb() does IBPB, which (among other things) flushes branch type
> predictions on AMD.  If the CPU has SRSO_NO, or if the SRSO mitigation
> has been disabled, branch type flushing isn't needed, in which case the
> lighter-weight SBPB can be used.

When nested SVM is not supported, should KVM "promote"
SRSO_USER_KERNEL_NO on the host to SRSO_NO in KVM_GET_SUPPORTED_CPUID?
Or is a Linux guest clever enough to do the promotion itself if
CPUID.80000001H:ECX.SVM[bit 2] is clear?
