Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C383F19C561;
	Thu, 30 Jan 2025 09:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738231071; cv=none; b=ZT6Trj1vJ3AF/CvHRiGNWGRtVILh53SOXPk3cu/RixMhdnxD5NtR/U3C3n5H9YWssDgGShFjhNtWShJLUF/EFQLHOxph0c8mFBBzlj/tiI1ClGa8OeXF27RcRipyKO6Bk81Gm9bxTbjBGbG8eYLx9z9A4rp+KmVUFgJCo2ubfwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738231071; c=relaxed/simple;
	bh=SQquybbvwl/HsG1rCENfMjHACErKPMStwZDHzl64xLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Uz/bCyFTEyt6cimUQ288ffOs5rBlLNqwQgiFbjN51OmC0AaMEAMkJ6SzmEa0/aVxsCU1ZZH5yOaXpg4ogtLdX0q7ABrcXkAylYrYzFvGkeU1pXaSxjBzvAWtmm0EzQKdJtwArLH8lplQZ+CRuFK993Cf50t+A8s29M9911WkTsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlZOaHN8; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlZOaHN8"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21634338cfdso13119245ad.2;
        Thu, 30 Jan 2025 01:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738231069; x=1738835869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQquybbvwl/HsG1rCENfMjHACErKPMStwZDHzl64xLw=;
        b=TlZOaHN8q5ch3KOGcsid1Rj2HVtpfgFavBB3FZShHtjulGuQW4NAwxmD1RstXl+q6x
         a4nuA+okThHa2W16ie0j6sg28XXGXVuMWdbHtaVILXN3H6ZrBu94QPXp2ndun7jxbiBY
         U1TDI9ECjGfRIrkGqrRllNvMsjUWOVwa+4x+izBKYhoGoRlDj/Dmgegri7tRh7mxeNtB
         jJ1apUiKNC8ORm3EdQp32WRhZGicDjvpPwRZNrBhlrXT/ZRXjcIK1rch5UmP4d25YP+e
         q/WKhVZFcXA4MFY2xNlVA9Rs+3nMXC6m53uRMd6VJJLS6hN0yO/ehFrDTR6ReMh1YVGl
         SYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738231069; x=1738835869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQquybbvwl/HsG1rCENfMjHACErKPMStwZDHzl64xLw=;
        b=FCt0askSqUetZQvXC1uJIef5H3m3cbuf5dYESTnG0/oyED+iN30qtMlb9jNO2GLBYz
         f/BrxWdgKM3dDxCeFBh+JdfbiFJ5vAJNfnhFhSA7ucOz4N8l0ObTaWswe3YR4EcIgvU4
         8PSQLEn0fRpZAk0nXpc1yid/pBImzytfNXWDAzZF8FrfixI9RgEYL8PNk+MLuvHKMMoz
         DRrp2AgYQFfiohp2Yl7BPn4ub+bN+4N8usxTHwkqpaU1dkiIfV+HMGNVgo/YDSMl/kYt
         7uoNXTr6XUsl3how9TRTKRJ7Zc2ob+zeqaMefWVebn/dzgXeyDcgB+oczR91LF5QKJqJ
         KObg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ/gji2v5PXRLLR8dKYYotpRwHhTh1FBwND8codqaj4OiFgcONTUO0IpMyFFSzuZEVgG7QtlQQ6jDB@vger.kernel.org, AJvYcCVzp1GlKF3KT20QOF0tolt4TyGxhZJ6BbR3lINHsQoOLT4ipLl6EL5id0Jg2KKYAbuZaGDpvxs0Y37fh6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQzEdAiNejr8qhQc09bFWe2haPjAi1mxdrC9Z+AjUFE0JoLQbm
	sSzsmCtIEn+YWqar9dvjRD8xKZoF+qRDpUloyqXPL9U8aNp5fA7A
X-Gm-Gg: ASbGncs1iVLdMYJcY0JkFBfWwAVXjuLDO+WII29cR0VH6MFKladkf5ULS87ja1nRsLM
	opItUrQUUp/TQaI9r06xtNz7SoZ2xJGvPde+/meuVT1BeoznpoQrVkcDGnxDLbXTav9d4qcYAOn
	lRm4zXXUjGFQ8Ok19gZ6qsvGOQqE0N+EZ7B3EBiNoXmQ/nmgDfxTOteQpvlHygo6Rs+ItsEq7tl
	Au41MdZp/+ogF7sjSWZucoJhmwv6DAdtxV0chrphJkndSaG8385RAUNred1E1tlwetoVm0nvNCv
	L9M3aLaOu8l1sMv3
X-Google-Smtp-Source: AGHT+IHEA/elnGWvpofB2WJFqw4tMKCTHfvLmoHne1Txj7wVmJfdftq/RjdEx7IFyeO43ZMPNCkfoQ==
X-Received: by 2002:a17:902:db08:b0:216:361a:783d with SMTP id d9443c01a7336-21dd7d792e7mr119158695ad.28.1738231068928;
        Thu, 30 Jan 2025 01:57:48 -0800 (PST)
Received: from ubuntu.. ([175.141.178.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3303a8fsm10275105ad.197.2025.01.30.01.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 01:57:48 -0800 (PST)
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: andreas.noever@gmail.com,
	michael.jamet@intel.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Subject: [PATCH v2 Cover Letter] thunderbolt: Disable Gen 4 Recovery on Asymmetric Transitions
Date: Thu, 30 Jan 2025 09:51:06 +0000
Message-ID: <20250130095704.10779-1-rahimi.mhmmd@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dear Mika,

In this revision, I have decided not to define the following functions,
despite our initial agreement in v1:

int tb_enable_link_recovery(struct tb_switch *sw);
int tb_disable_link_recovery(struct tb_switch *sw);

This decision was based on the following considerations:

1. If a write operation fails, there is no clear way to determine which port
the failure occurred on, the upstream port of the switch or its link partner.

2. To restore the exact Link Recovery state after an asymmetric transition, I
would need to track two boolean parameters and pass them to
tb_disable_link_recovery(). This would expose port state logic to
tb_configure_asym(), ending up with the same design we already have.

Additionally, I have chosen to ignore the return value from
usb4_port_link_recovery_enable() in tb_configure_asym(). At that stage, we
cannot take meaningful action based on the return value. Moreover, re-enabling
is performed immediately after tb_switch_set_link_width() to avoid introducing
unnecessary conditional branches.

Please let me know if you have any concerns or suggestions.

Best regards,
Mohammad Rahimi

