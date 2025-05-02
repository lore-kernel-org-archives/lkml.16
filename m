Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33CF22CBD9
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746177676; cv=none; b=Vhi4FnoIRtviTKmVK0+nAkXR+Qr7eg5FvUP1E5Hw/aKUTmlEA9SS4nRYmBxeMW1POXxdM8XucnmRVAMp1O8nhEJPUziKdZxFH9kmAOa+Lw2F5saoO6mrkhVyXhFo8/tPhwkmZxLyt2CnFYjMOSe9gwuFR2qRIPWAeues35GxW0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746177676; c=relaxed/simple;
	bh=x8jU5cm1Fg5jhmw7TvC9ZyDUI9BUMgu95TARNLub1z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iXgfAHAuXE6aemBGLVz1RpXFf0umv/erAmPtn02IN1jbOZ7+wKnRiEt1QlcjT5ANRtMxAHO4otDiM/L4jOrfs1VwLFsobAPA9765QMcAIHuO/TuNrNu5ipetFj5sRSkXy7J03oIBbhyAqW4l+08ngJD4U1azBFngUv7fPatmifc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com; spf=none smtp.mailfrom=immunant.com; dkim=pass (2048-bit key) header.d=immunant-com.20230601.gappssmtp.com header.i=@immunant-com.20230601.gappssmtp.com header.b=CksqR2Hf; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=immunant.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=immunant-com.20230601.gappssmtp.com header.i=@immunant-com.20230601.gappssmtp.com header.b="CksqR2Hf"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e732386e4b7so1719806276.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 02:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1746177673; x=1746782473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fB5WC809wTl4CZgtJWZZ9LIth3xEsvGA35RJbEoV80=;
        b=CksqR2HfSZUug6RWSTKogsV7fnzNo+kkR6pWNAzdSjm+e5tJUNm/iq7LKZrgqfT99j
         3Eoq90fKaYOi+7/vKpCWVmF+mJlJVd2ZH6kUMe5sPXlz1Ygnn1H71AFP3s+QkKgQSD53
         ZxLCxQacaX0/fjeCUbMidFtVl1VJnpUHIWsPuR3sCVNQOkmKqB8mavyPLysBJpOqn83e
         wuuN6II7aaRl740aVOFENf578hyhzgiwYLOW+o43Gx1qAvrN6ODGoY0o+fpXd3vIt27I
         XnwSuQJpmBDkeai/igw/YblJB4MkASiBpvsXERX3KL05la1tjrKxWCVW12CM4LTbkhR7
         hJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746177673; x=1746782473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fB5WC809wTl4CZgtJWZZ9LIth3xEsvGA35RJbEoV80=;
        b=YDQP1cfmw4spwiQM5m3q9fzplnPaXodE2Ie5tsdgkz7Gy4d3aZ4lxZsYBJXdrjeWve
         g1VLaBDmvQP7p1dYBHf+cm+2xed35ykOs7dir2LA677/bDoR21hS7iJSx4W9CfhwRxkz
         AQ/rnis09xNuHfRZOulFQLuBFHpWDiyQu7W8MrRiGPex1qTm40ejVSVVw3my+sN6fgCY
         YcF48twnikStEIXGJzHytHaS6s3dPAbUc1lS2W+Tgyk8Izbry7uDIs21Zqb1XuyAh4hO
         tHWCvHVtaTiiIAfG6cSySpbDQWaIMALogo6jGkPNB6p35ne4HtqCUe/kOwJgYKgap/HQ
         nG0A==
X-Gm-Message-State: AOJu0Yz0H6jIcywZyHcXDhCck7yRCocEl5kPbpFS+uDh4I/Y37x6Hqf5
	FgzxeSH19I0MrontLzBl3wKuBEV4G5EKYcl0L7tbCEMTz3QwPwJRJNa3fmbYWvBo3tEIk08qIZs
	8lx0=
X-Gm-Gg: ASbGnctvgWf0k2X7sjGVYCEkB0ddYaOyIEDeDg1OaMjo2888gdqquuGRYWgbfQdwGn7
	u5Dd/90Ik+dEz0bj+E4+0tFeLZZE2mSrIVD6thLVew11c/vvxxBnwUCxHnRxBniy01LnrDWF72/
	rWTRjoDIBr1lpTqlM97lEy5v0eQfRIvydnKAiVVjAL4kp9uD4Esec8K1KUWZWq8y6yiyQd4SiMk
	gLGneb6FuMav8n2zZgYPTVhgmTlOvScy9/jj3uoDg4g0D9sdua5Ks98tDtOAyPfVvM4xxhXSZyK
	zBe9w9++TpmDBciAKU1f3pcLh/MX5hQJB9S94xlVaR0tVO4AyjWR
X-Google-Smtp-Source: AGHT+IGQUPnvqf/qgEgSqRGNA98GCO3ipomvK0QEj746mMZOPYN8VysAcht5q3HIlb1fWVBbhO3x6w==
X-Received: by 2002:a05:6902:2085:b0:e63:ecdf:4d6b with SMTP id 3f1490d57ef6-e75655490b5mr3096136276.13.1746177673505;
        Fri, 02 May 2025 02:21:13 -0700 (PDT)
Received: from donna.immunant.com ([12.9.190.3])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e755e7d92d0sm556427276.55.2025.05.02.02.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:21:13 -0700 (PDT)
From: Per Larsen <perl@immunant.com>
To: linux-kernel@vger.kernel.org
Cc: sebastianene@google.com,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	jean-philippe@linaro.org,
	kernel-team@android.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	lpieralisi@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	qperret@google.com,
	qwandor@google.com,
	sudeep.holla@arm.com,
	suzuki.poulose@arm.com,
	tabba@google.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	armellel@google.com,
	arve@android.com,
	ahomescu@google.com,
	Per Larsen <perlarsen@google.com>,
	Per Larsen <perl@immunant.com>
Subject: [PATCH 1/3] KVM: arm64: Restrict FF-A host version renegotiation
Date: Fri,  2 May 2025 02:21:06 -0700
Message-ID: <20250502092108.3224341-2-perl@immunant.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502092108.3224341-1-perl@immunant.com>
References: <20250502092108.3224341-1-perl@immunant.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Per Larsen <perlarsen@google.com>

FF-A implementations with the same major version must interoperate with
earlier minor versions per DEN0077A 1.2 REL0 13.2.1 but FF-A version 1.1
broke the ABI on several structures and 1.2 relies on SMCCC 1.2 is not
backwards compatible with SMCCC 1.2 (see DEN0028 1.6 G BET0 Appendix F).

If we return the negotiated hypervisor version when the host requests a
lesser minor version, the host will rely on the FF-A interoperability
rules. Since the hypervisor does not currently have the necessary
compatibility paths (e.g. to handle breaking changes to the SMC calling
convention), return NOT_SUPPORTED.

Signed-off-by: Per Larsen <perlarsen@google.com>
Signed-off-by: Per Larsen <perl@immunant.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 3369dd0c4009..10e88207b78e 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -712,7 +712,24 @@ static void do_ffa_version(struct arm_smccc_res *res,
 
 	hyp_spin_lock(&version_lock);
 	if (has_version_negotiated) {
-		res->a0 = hyp_ffa_version;
+		/*
+		 * FF-A implementations with the same major version must
+		 * interoperate with earlier minor versions per DEN0077A 1.2
+		 * REL0 13.2.1 but FF-A version 1.1 broke the ABI on several
+		 * structures and 1.2 relies on SMCCC 1.2 is not backwards
+		 * compatible with SMCCC 1.2 (see DEN0028 1.6 G BET0 Appendix F).
+		 *
+		 * If we return the negotiated hypervisor version when the host
+		 * requests a lesser minor version, the host will rely on the
+		 * aforementioned FF-A interoperability rules. Since the
+		 * hypervisor does not currently have the necessary compatibility
+		 * paths (e.g. to paper over the above-mentioned calling
+		 * convention changes), return NOT_SUPPORTED.
+		 */
+		if (FFA_MINOR_VERSION(ffa_req_version) < FFA_MINOR_VERSION(hyp_ffa_version))
+			res->a0 = FFA_RET_NOT_SUPPORTED;
+		else
+			res->a0 = hyp_ffa_version;
 		goto unlock;
 	}
 
-- 
2.49.0

