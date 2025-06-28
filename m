Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13E71854;
	Sat, 28 Jun 2025 05:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751086879; cv=none; b=qPFJHYyDIzYf3+rrMYyZMyeCPUBEmxjn75bRjuOIs+VrImMKUmTgIaNtdoYGnGMkwg/fCamudOcka0gfLtgu8/nswkgpq0YkaFl88O2QZ7SRpez1lncYXi3wBA8rym3wqbQvHZnjIVO4opX0D+n06D+RVF9JqHklmiY1/Z1zm+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751086879; c=relaxed/simple;
	bh=kkcY4QO1Oa0tgwGe1yvZlp1RmVsJ4/W517+w4wgDoIE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YhSoUIMJlNlf8yB0d77cSatTKDNgyS/BU/1Pg/L+55kCtVlrCrOV3BT4tyZDJMWhN1n5kQRPutxNg+4/PeTQ3c2s2m3gZAIyNJP2iGhOJwEDBuqJkzlh5/nshbbu/C5eiv50+GPD+Si9SIQ3hIyVv0CNUa6+ZMgVPZ6kQDbvdJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apo2Z+8A; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apo2Z+8A"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6faf66905baso5824566d6.2;
        Fri, 27 Jun 2025 22:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751086876; x=1751691676; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BcuDafpKBlbr5L7tzKb4qdPO1+9STlnsCkt4WJe7uAs=;
        b=apo2Z+8Ac64KgBD067k8cAni3X72p9bqCai1+0Uk5Bj6irtlAkS0uS6UfYdQLcrOws
         0aE9Vb/nD7MOgNfloMQqzS/W/fkFbNyHkb9OXninO9R5IZn1LuwSAFs/BglNAzOQXlNT
         W3giTXh+MB5TQIm+aFaykS5XM+ZtYbCYq6K65M+kwKEa9vuFy+mGM6ghdkk9Vk09CjmN
         0sCzoDLa+y1Qx62mOZ8cUYOamhYvu5SE8oZz/01PV43gKL5pRuY7WY1aUuDJzxFy+xgF
         GWHj/4rRIRnBH8AZ7B3aTA1p9Ma8JCNGMDgHtZzBIHd72CX6h76xxJX/fvti0X9oXEDu
         tR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751086876; x=1751691676;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BcuDafpKBlbr5L7tzKb4qdPO1+9STlnsCkt4WJe7uAs=;
        b=rmcXkzD6Zq+QABnhwZ/ceylOOcNYr8IfJRmG6tBypJtAi5eGl0gq28uD6Mc/CVT9fR
         tU9kYf5GaBlyjmg3SnK7bSE3g9/rgubqQU+nMgFiLkoEntk5VNG20LZl2Db1nKgvegq/
         UZBn5Wy1p9h3g7k/sHel+MflH7UGqaeMnGLfnAckfwWnSX1fNEiIkDa3GPaw5FmdiSZ7
         fk9hRlDWap0bo3upHA5rvMt5DKJxHd8EUyhruvwx72S25l0n9ksMMem7uUI22OTx4hue
         BnMO5IkFQ+pUPV36cT7adjn13Af+bd6DHNKdGCYuANimW2JD1wRzuZ63O7Qc4gaMgnhF
         tW5w==
X-Forwarded-Encrypted: i=1; AJvYcCUhhq9vCU+yxohmEBiB1cqeSUyXVTh5iJNJArf7cffOGWn2bZgL1qOgvGMK1PX2y+SO3vw1BEsuoDuKiKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYnKt2QXvZwQc8udx67eLcuTCsMFg9NaO2xt5HkbD/F05mAJX/
	J/htZnhJIRuifCIWd0J4CTplyZh2VNVp2Ybz6URFza+4wXrdM6lVs0qrbHSaA3pN
X-Gm-Gg: ASbGncuEMHgYQcI3wba3iUK8u5PRiuqVNKvelzSEaZaiopWSuCQdGhKeWl1tkhJz+/G
	XfQlEp2N9HIiS5/Cv94P5i8qcMWQ+oF9WFj1DS/yQLvmr6dEmlkgN/LcovEPx1kLRUgNE6cJGDd
	oOKiAuTJkPB14a16IDfbSLpKzl5GiyF1phv2cd0/gfjEAbNGjLTu+4cOJ9jAyUenj7X2MztXxBp
	f8MQ00L5lx+yw1o8CwfqhMbyGQlw+n3YaJwnImQxh8hISYAxWYxKvqgIaoAQHmRyqaqUD7nTK00
	esNZL8VzVCMyjc57/KTRcdaGjk7A+TQ0V0EQpI5T4WOK2TGACAP6kwjHvp7IzA==
X-Google-Smtp-Source: AGHT+IE7a9lEhrmhuHGu1oCXy1ot+/dEDjYR5Aby64kvvllOBmoqZlWrDlazOJYhq4lz8b/r+g8DVQ==
X-Received: by 2002:a05:6214:2aae:b0:6fa:c41e:cc6c with SMTP id 6a1803df08f44-70002dec8ccmr101167506d6.15.1751086876547;
        Fri, 27 Jun 2025 22:01:16 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e34besm31504966d6.75.2025.06.27.22.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 22:01:16 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 0/3] platform/x86: think-lmi: Fix resource cleanup flaws
Date: Sat, 28 Jun 2025 02:00:45 -0300
Message-Id: <20250628-lmi-fix-v1-0-c6eec9aa3ca7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP12X2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyML3ZzcTN20zApdSwtDE+MkQ4MUy7QUJaDqgqJUoDDYpOjY2loAagD
 RdFkAAAA=
X-Change-ID: 20250628-lmi-fix-98143b10d9fd
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=614; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=kkcY4QO1Oa0tgwGe1yvZlp1RmVsJ4/W517+w4wgDoIE=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBnx5cJPJJP/6QYtSXLuyFtwV+hz5815W5cFff8veUew7
 bq1s8eijlIWBjEuBlkxRZb2hEXfHkXlvfU7EHofZg4rE8gQBi5OAZjI7XWMDMczqszvFnMmZc6p
 Fj322MNYm3FJ03z+VC+r5T1qP3RUMxj+mT3+ZlW+SSTXIuj8mtmZGq0P1+Uc/FiusmPne2FW2Xx
 NPgA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Hi all,

First patch is a prerequisite in order to avoid NULL pointer
dereferences in error paths. Then two fixes follow.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Kurt Borja (3):
      platform/x86: think-lmi: Create ksets consecutively
      platform/x86: think-lmi: Fix kobject cleanup
      platform/x86: think-lmi: Fix sysfs group cleanup

 drivers/platform/x86/lenovo/think-lmi.c | 92 ++++++++++++---------------------
 1 file changed, 33 insertions(+), 59 deletions(-)
---
base-commit: 73f0f2b52c5ea67b3140b23f58d8079d158839c8
change-id: 20250628-lmi-fix-98143b10d9fd
-- 
 ~ Kurt

