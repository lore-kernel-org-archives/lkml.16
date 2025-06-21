Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A887713B293
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 07:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750489866; cv=none; b=UoBiZ3HCRRSaSzPJBCRXHSS420NmLmh0qVA1l5Elsct93M21U4d56rWNblCJwbYneUoTMn9McC0bteC0Q2YPhHHKaqWP1aB3+fVSZYj8CUcbaxwX+k7bclN9yXVdfd72dYxZqA13SwSrraOuf5VKHIu5P6jMtFgeKZ1y0oDJGzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750489866; c=relaxed/simple;
	bh=nmUj9snqJ92NcnFdjoLWl6/28q30/hHmK+AvxNSsdho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BYuXnkX2oMCTb4yuSDP+5lnhc3nCKqKPQsCgzLP/Jv+PW/n2omZrm+8/HPnyudSZq5fmsT42xjJkwOgwHbt7zlVgFXxf012H5YPQCHh+TDlrCnUrsGDrBM2ew75l1hzrgdg9DCUfFncKJ7xU+lNBARAv/QnSL3FfuJcPBI4afis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSCALWZW; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSCALWZW"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4f379662cso2194646f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 00:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750489863; x=1751094663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmUj9snqJ92NcnFdjoLWl6/28q30/hHmK+AvxNSsdho=;
        b=FSCALWZWWTGtJ+FzqTTyW/oL8o81uCWWJIQw89T3Iy/eV4rpU7p4vhvyLw8coCvUtp
         3VGlonzFMZ81wm/t+rffWJrePzRZexoHWkHbTDM1d17WwFWo2E2UuWQmE3SUtQM4Uzcg
         htnOtsJQK8KjcMmUpRXtAdD0oJYn6juja7uX4St/MFr3pRx7d84YrX0fFsrZmyf1qUpH
         Z/pPLyl5n7ldXuPR6Vg3LjFDGWJea39NqzlXdte603ntqxdkVhW4NWMVfUmLNuAGS+4I
         K1wAhPLm1R8yn7pi/Sxmy8DsEtf5VKlNl5VdBa56vEe8tVnbF2oeTag4JcpPP4Fhga+d
         uKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750489863; x=1751094663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmUj9snqJ92NcnFdjoLWl6/28q30/hHmK+AvxNSsdho=;
        b=em2DJGeZv+iBxSb7Nxt+L3mrNdwZiI6RiCVEsFcQt1Sno4EQrIyvPUTA8L2a89hUh+
         qNq5QUTlQYJsJ54rjiscv968Ud22GkfPy6imqgHFmq3HM9dHnLWvpEGO9mAS6eqyfkii
         Ybis3Zc6EoQ6/kXhYn0nCTbphIK+5zCRsiXEOJO6UuWPJ3YbtbS3ANdhbq5OLiSIAgOI
         nkaHKLpPPo7U4sBVQxVD8VkHMIRe+jHxeee+PoPAhvBPUVYAFPfNMLg86VmvBrSQKYp6
         9YXvXTbDQxfkEyuXF4MSDdU6VKLT7Dpdmi0/ydFSulNiX4z4uSfb+HIxhnd2LKBOqZnW
         lI4g==
X-Forwarded-Encrypted: i=1; AJvYcCUP2gSYfDqz2pfbodomezgLHAaoFPlcZtjVUaqkZaqE8/mjsXeQn+WBftzoZYZm8XDU5XeXvnUngGGBr2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzbm+pYj2217bL/d1TCbJmJf56Wfiq7RLJ2WDzFAEOEziTkgi+
	5uLITd54AB1kaptI/AFkB0C3O7JmQlZc3dME+POMMEdINdHtMBpHmtqe
X-Gm-Gg: ASbGncsXbVQouwW2XxQSqSCTg9lzbgo9yfVeiPw4IfZE9f2Nv9oVRCVCJY1XZR6ORZJ
	ND1xI+L99OjpfFmD+Kx7Gw588pV6LbOTYl/QO9XWX3dIORXkOBCYdS93Nn34MzSpi9U9CGAXgFb
	Rg1Za093MElgvw6/5nn6CnnjiH33UdbKsfG/ksiwCGvcqaG3rqAQOsL8S/ZnP/PK2GbdnSq/k3j
	czl8BU7SIe2FeSEuFuUqFq/wo6VjrrmL6ljLbtSP8cpVI4GZFlvnJStsRGItlm7ZH3zrxqZo7ej
	QgHDWywuHaEmGb3aC8KYpEa04z7U1Mk50jpKtIYfUVfVviImFWDr7VnHKRsZkNrfoGHf0T1bPPs
	7
X-Google-Smtp-Source: AGHT+IGLymAqCsdMWlyXf5rr9MCAK7WH7VexD7Sq2afbhyBBkkmCRCI0j/evO6kSsHsyuRuPmUw6iw==
X-Received: by 2002:a5d:5f4b:0:b0:3a5:21c8:af31 with SMTP id ffacd0b85a97d-3a6d12a41a1mr4531683f8f.16.1750489862810;
        Sat, 21 Jun 2025 00:11:02 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d128d063sm3895589f8f.101.2025.06.21.00.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 00:11:02 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de
Cc: peterz@infradead.org,
	luto@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kernel/entry: Remove some redundancy checks on syscall works
Date: Sat, 21 Jun 2025 07:10:12 +0000
Message-ID: <20250621071020.684-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <87jz56p0tl.ffs@tglx>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Same prefix comment as for the other patch.
I will fix on v3 if agree with me this one.
> You also missed the fact that audit_syscall_entry() has yet another
> check for audit context, which means there is still redundancy, right?

There will be a redundancy always. You told me earlier of this patch it is for performance,
however my patch makes consistent by replacing the upper context check to checking work bit.
We can't do anything about audit_syscall_entry() because it is used in multiple places.

Is there a problem if we just replace the upper context check with work bit as i did in this patch.
