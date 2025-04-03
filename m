Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AEC251788
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743699438; cv=none; b=HQ8VadYYfhDh/sDC+xbf3y0GYyq8cN6Xr2wf28QNT4IsR19I+XLkBgKP4RAtOS+STLilkrZEMDQIUQ12nUFdKuqlU+p2C/aNCxTZcqN9suXqsx+lq0keTvYsMZnefCL4laIsdlYIDb0ILixAZQMyihMSCcRZu6f8+JDwIVn17ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743699438; c=relaxed/simple;
	bh=pZlVCJRViECraWY8Y+BJqWX1y/rA40Dggavq4E6VOKI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=WGwRVie59mbVUUcGCZbLDWj/vIu2ozhO4g1re9cULA64Be3nmRDwkkPTU9Eo+Q/yVvPg5+jrPYCu24WiE8wJJGyzNi9ZGQfcdkusZDGEJos+JdSq54OzDWsibQ0eVkagZaas5B5xES8v1cEiezfKHLfkbEuyuxlyLTrTIdXsqJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nJ5gbWGW; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nJ5gbWGW"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af54a9109f4so501843a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743699435; x=1744304235; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qdGNPnhkmnSYFw1hLabTm19S3ZzmXtS5SLBi0D4Xb94=;
        b=nJ5gbWGWxkrptEFGU3qd1VQLU1CRLBZMUx/GazMVA5EpeS2uHrpE0tanTvIbQK4PUU
         5K0sdUI7ta8ZX13vxbKP8NY8H1bcy+TuiepRnaIf+3rv2U9iXptdXI8mEcylCArSxk2K
         pSWdqJfZGRC/d9sVFCZkiqUfmFh7JoSBPWjQxk4SAKrH5Rfqqh891srk08kKTgyiR/xZ
         uvNOjYXO3x5ZPY/IOmo0laIzNF0X3QQo7Q3ThK4Ae7aMnJtY17mYjN97QllNUL/iN5Tk
         9KeqY1sD7CWBiHjhYd2SCAVyKNRpRdw0NV2+mNgK6GeYlY4nw0SHIML5YMBVezK1VjO6
         q0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743699435; x=1744304235;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdGNPnhkmnSYFw1hLabTm19S3ZzmXtS5SLBi0D4Xb94=;
        b=QHHTTuRI/HBeSj8xt9d86Xujkt9yV3TfNjwNL6dVQ14vvX2hvZMH/S+QbogRW/fQhB
         aHL4Dy1xfhQGSyRSs1tMGuh9fADqia1d85DcxopN1Am3jszevU4ZaPQlMVQEijL3/g+e
         yDujx6Nfd3ZoQaWzCi4DfJNyKv/SZ9DXhV+PnzCjZ04KlbivzINGcoYEAMWY68KmVqqy
         FqN89zTavf3aRnWWSCzTYwJtRi3ngpJlS7LvO9h0JL2AMmdAptBYGwMup37TNFgKVHNl
         zS2QX/ZlGbpu6wlEh+zFhAtrpxqlr2MFI+iN2xPCISpFkYuvykoPAZWZOHY1P14LVLeb
         CXAw==
X-Forwarded-Encrypted: i=1; AJvYcCUPiwIl568bxpgDBS8lUqeKdykg+wLKFSYwyQFGTCbaZjzb7qqPtCNiJBuhiXD+L/uPpP4jarLn9YZ9NRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPCSwvrzAvn/qLaGakC11L9FbaNvawG3BbqkmGdUGavh8Iqffz
	RI6fOmPuKpY0ZHjq1W5w/K911TwKVegDJe6SMJjd9lFUQKjMrCHxjFWj+r7kB9mWrlqBhqHLesI
	pMUc+6g==
X-Google-Smtp-Source: AGHT+IHf4+lZdfNC4Pd+fVVLfgEfGYIen3a2OuSa3UqLYxlvTyLWi+hHtj2Vluq/obtqYLkaNT1ivwRzacjy
X-Received: from plpn4.prod.google.com ([2002:a17:902:9684:b0:227:eb6c:504a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1c2:b0:227:ac2a:1dd6
 with SMTP id d9443c01a7336-2292f974a5bmr344475055ad.24.1743699435654; Thu, 03
 Apr 2025 09:57:15 -0700 (PDT)
Date: Thu,  3 Apr 2025 09:57:01 -0700
In-Reply-To: <20250403165702.396388-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250403165702.396388-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250403165702.396388-5-irogers@google.com>
Subject: [PATCH v1 4/5] math64: Silence a clang -Wshorten-64-to-32 warning
From: Ian Rogers <irogers@google.com>
To: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The clang warning -Wshorten-64-to-32 can be useful to catch
inadvertent truncation. In some instances this truncation can lead to
changing the sign of a result, for example, truncation to return an
int to fit a sort routine. Silence the warning by making the implicit
truncation explicit.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/linux/math64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/math64.h b/include/linux/math64.h
index 6aaccc1626ab..f32fcb2a2331 100644
--- a/include/linux/math64.h
+++ b/include/linux/math64.h
@@ -179,7 +179,7 @@ static __always_inline u64 mul_u64_u64_shr(u64 a, u64 mul, unsigned int shift)
 #ifndef mul_u64_u32_shr
 static __always_inline u64 mul_u64_u32_shr(u64 a, u32 mul, unsigned int shift)
 {
-	u32 ah = a >> 32, al = a;
+	u32 ah = a >> 32, al = (u32)a;
 	u64 ret;
 
 	ret = mul_u32_u32(al, mul) >> shift;
-- 
2.49.0.504.g3bcea36a83-goog

