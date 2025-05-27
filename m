Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A285727F756
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748362438; cv=none; b=jHjU+NCYosgD9UPhjRnWJvRhVsyR7TM45b+eufKvvi26dn0KpDNcMYAtw5Xd8w/D1eX6XTsIdqCgURnzFzJE06cRw2EWMoz8rha6l2yG3Hrc7Py1cwrtEWWt8kL6I1sgdE1Jvdw3C3b+rUD9aNYhbkx8mHyCtQH0ti95M78PD+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748362438; c=relaxed/simple;
	bh=iqiXA6Rbb03tF/HCDxpk+ZKgjSzt6H2Xax2VkzI4ddM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qLjyla2BntuJNBt9TrOcx7Rw0MvT7z5e25/qkvWs8gv3grxyV0li49SIOhAY6DUCs6qCqidEua0n+OPC/109SO8S17TWaviWk3QSxZxGWJUgSJRFIdkzdicLkd9n8rzhand4yVqRztY7K4seJ+1DinQ1e/++P81ymbmXv3Xhti8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RMH3hmLy; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RMH3hmLy"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30e5430ed0bso3366678a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748362436; x=1748967236; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CyI6lRGaIfXB7jxaPrJKSQO0H+oxISfyvnAekkvYBnI=;
        b=RMH3hmLyHISH5G40SFaCFagFLlD/u+x0m/nughYU6Yb/2VD0SwjvTl737SYtgjfBJL
         swt2IN5HaAZIhiXJCf/2PTdwWKdi/S5hMZ9wwqf8oIwu4s9mjHBQosaixGjEbyxsmJA1
         B1LD4SahbsWCw1CydOmIO9r+fBQD/cdMXdsOAt+HhF553+wEnmjUPlFoMkGsi4a04N5H
         Vs7I//EBoKNFSDuRabYMtl50ozP2uImtEn25ENMAgtCthpl9PEgUd7M+lf2K5tbncA/f
         qk/dKMax1F9fd7oFfNihRO9k/n9liX7b9vnnrcKvurBxGaditzFTjWTEIFoW7ABohRcc
         X/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748362436; x=1748967236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CyI6lRGaIfXB7jxaPrJKSQO0H+oxISfyvnAekkvYBnI=;
        b=I/PaGLuPwDXu2RWLEl5ypJMGIfLAGkWac7vcRr9zfDsJ4/75j0AbsRVZQC7pUOGGuq
         zZWiZsZPeE3/zBhDx9zdt0ZEqWwXJ3yF2Aj56MDPSdO/3mW3r6536OsQ26H2zDS/OHp6
         BcFJPkylByaDDtP1AyDbDLmS8GRQSPV+B0cHLzaNvtukwuJ88eeTd550ekqSqHZ46Ru6
         ly60sDWNkHnLb158XfIklfvvWsutrzoPn0oEpFqDptgng0XSxm/2gkTb0f7qUvO+jUFu
         Hpqb+q6QJHH7ZkQD4Sp1OVCmxTE6LCHpbKFuDDhYMugMJypg05BBK/qJgnBH/HtEpGL3
         +8Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ0hvZmFaZdeIm7QRaqYB9UuTGioA4Xxi4JZnPo6OtkhqnU2M4aOIdvBE1xIxwFIXM5ig4fI2bYkbWGlU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdt/SeFBWVkmVWtuaRFgRaIqDGypnTRjvLFWjjQbemuuYrYla+
	u555KY1E75gwr/EM/BQZyRgy0uruYswHGL1mbRdrpV60bfAPv/sfmoZIrGLZiH6gY/1Ymv62qXo
	L0mQpZayWtNy2GHB3C2GHOZZVTYV2+J/hd5xwCEHo
X-Gm-Gg: ASbGncsBK8vN9xTjGDYJRIQo93oCHlbtiE98WnV2vxGBy528ySRqgPwqNpgrTzsDMo1
	epN3BqTpnGJJynHVgQI8p9kIegJGHSzCV8wCQ35yI6zZ6+yKGsqb1y5Uf+BL9RxwV9K9G/bbZ7r
	29z+UcJMb0Spa5TFwhrrfIUngt9PJEvj6PkhEACC8JIZJ8
X-Google-Smtp-Source: AGHT+IEFXnUmQcAwZf0IdnuZbXNQFTMc5YTTUzgjQQa6keoKBAojGNaeiYVFV4H1X8znHWDrSoSoOeOR7BiDVmVBRMw=
X-Received: by 2002:a17:90b:574c:b0:30e:3718:e9d with SMTP id
 98e67ed59e1d1-31110d99815mr22155423a91.35.1748362435541; Tue, 27 May 2025
 09:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428195113.392303-1-michael.roth@amd.com> <20250428195113.392303-2-michael.roth@amd.com>
 <aC3m1uMmp28gSm3r@google.com>
In-Reply-To: <aC3m1uMmp28gSm3r@google.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 27 May 2025 09:13:42 -0700
X-Gm-Features: AX0GCFuVQ3lRhOu8bBMkwtNkd8VOCPOAbdPGDH93Xwsy8_b3o-5N_Qdrv4KHUx8
Message-ID: <CAAH4kHbcLkGQ4yLKOzRzW=JP5QouonneYnAMU3eqZtPKVVF_jA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] KVM: Introduce KVM_EXIT_SNP_REQ_CERTS for SNP certificate-fetching
To: Sean Christopherson <seanjc@google.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, pbonzini@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, liam.merwick@oracle.com, huibo.wang@amd.com
Content-Type: text/plain; charset="UTF-8"

> Side topic, what sadist wrote the GHCB?  The "documentation" for MSG_REPORT_REQ
> is garbage like this:
>

Dude, please leave this kind of feedback in your head and treat your
collaborators with respect.



-- 
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
