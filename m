Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E7B2BCF66
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842886; cv=none; b=GBhPBivVHgDac3jxYZz2e+nPC+Up+iaRCxnzJYhKLVNrkAOqSlJpi8n52AUarmhJVoXU3+xkQok01SIghfviixbdqeHT0mWJ2VhOVjV2uqkLhFk/dunAfJlmz4sQZsCOS4GvqC4LUBgP2mqEYRYdJ2/GN2QHnd86c1L9b0GJHNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842886; c=relaxed/simple;
	bh=6jOwOjfHBLUytEzmwKQuMf9peA0A54DjyUpxSjnkgtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G2VbWsi9/BFwh2PaohpAAMQ+bQnYeIg9J9Ry2dF9OXjc2YQTvj3rKA98RoDlz4dRJ/9Uc4v2pEFYN4T5wqhEGfvHZbFb9WJ233m0gRD7l3OVXRItJoGWVycpULg03b9flR3kbVYq3mbDQxCN0WMsFgSL7AlEbFP/556QEbqG2Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Ga0dbPT6; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Ga0dbPT6"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so9616173a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842882; x=1751447682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UAc6RebJyqWkfWaiafshoyDeXJgwWVip4sEPQbkZWzY=;
        b=Ga0dbPT62LBudAjS5KAF3Dl+1ywJMm1T+/EgYrcfqWPrcdqR1Ray6LpynM/gIoIXzc
         hxhlZ/AALcxfOnn74LeXbsB72ONBB9/b24etS5nkIIUUOqqYS55N4LXaCZKTN1gNPlXX
         93kQ5EnIoJPP14Hh5Pvbyrd2rvSfbJayry5CunpfnCAVd8HdASMF3gYLByN4ZxEyDCeb
         6wcF16CIncHTqa70b8Z20OudTju+0J+gbZtgBIEi54DLAvgCzXZ2m3JLZiYzcOxurP/f
         hoarw8jhyKIOLwBjlphRm1v2Kkz8mgOmxFE65o3DASPpksY+3DjxPYaDFMEdR37Gt01l
         5LGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842882; x=1751447682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAc6RebJyqWkfWaiafshoyDeXJgwWVip4sEPQbkZWzY=;
        b=vW9lABclcccEA+kL1w7pKG4QK9rbIXakL5Eo4c9y1ROWxk3veKqtpF6SfN75f/c9uW
         Q+wqZUU1C+yyKjNe5Iqe6sMv99DpKZnQnoMuOhZHPwWxIoAQ0O0QCR6cxFhOO8SA2VQe
         TLtM9MoG7hQ1vOEHAJevb75wyWrKDtkuk0/k5Ho/XcPFuvBS50Z7QrgzAM1zI7lt6kut
         QU0z1gZsMIB07enGtvFbZlmJbtAiP3MbhdW4vEvEIKIZ+nC4D2idDjvaMgGf1vGTWX4L
         8RO7Gv7YNlI7i3JHnLZsQb7BXMr1Tr3eLz8kzlemtC0TtTQUqVsmIocIpiiylHx/hIc7
         H4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2jiWfLpGuCwP4Jp1nbbZsPs14KkiRZ4AXfqt7poja9tOK1g0r+bn3z+7unmspjP3ccPO77KmUEcgkB/M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0q5I3RFsEKFE1/earjSdRazXlTIVxGPEtRfEge2X+lvZ4+lr/
	wQkIssZJrFdTg/J/zhcODtc13+LPXpdJIfUSpUBbybMVu8o4VhZuF8h/O5+5NOIEKus=
X-Gm-Gg: ASbGncvd29+gUgp3cDihwu//lP6eQoNYI/Jo1OqRnK5eR1vEFG+uBChmobQD9qpn/ji
	6t2wXKuZmm5+XnUmeR0Q21MQOdY5wVHfhLPpCX0W5+Pq8TScaydhE8Mumv6W/UUGD7KPF/uZZhn
	B+1JIzP9m0s/vg2Z6c8d+pFRYZPih1rozPW6KufWc3eIfU5ECsIbaDvMs/1V0XZLqWAqe7fd0Xx
	Mz1rFw6nBYp/UXOJKVWzl/WOJZ7xf38s/aCVN5bFp7HIKIYqR27w2NPYDxVMvT5Nj9LmgGhNOr+
	zkMSMAO+xHEXx5D5wwFGIPUlt4v2i+8eMklg/ZvdBYjO6VpLVXOQVh4tvKntvDbRFM4lNKWbDwV
	fmZo8fIolS+tSP1VIJym7hO1ZV92d9Buw
X-Google-Smtp-Source: AGHT+IG0l8SlxqzbJy5yTWk4X5Wj8Qtynwz8Lsq7ZGJOC1TtSj2YLID6Gs1lC0BpZmycf4LOOW/++Q==
X-Received: by 2002:a17:907:e2d0:b0:ad8:a41a:3cbf with SMTP id a640c23a62f3a-ae0becb6e06mr214652366b.13.1750842882078;
        Wed, 25 Jun 2025 02:14:42 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054083c95sm1021480166b.91.2025.06.25.02.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:14:41 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:14:31 +0200
Subject: [PATCH 3/4] phy: qcom: phy-qcom-snps-eusb2: Add missing write from
 init sequence
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-eusb-phy-v1-3-94d76e0667c1@fairphone.com>
References: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
In-Reply-To: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842877; l=984;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=6jOwOjfHBLUytEzmwKQuMf9peA0A54DjyUpxSjnkgtk=;
 b=knC8BOEkeNO8OiE+NnKYB5/k14fP2simRn0FEiUH1MxKyG5zzAMDRqRJ4zNqyeyJsLSuAzNFP
 7cMvV9XCTULBI8qv+2u1CuI8W0OhIAvgqX7c6mnUvgVxb6/pH1mdEUa
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

As per a commit from Qualcomm's downstream 6.1 kernel[0], the init
sequence is missing writing 0x00 to USB_PHY_CFG0 at the end, as per the
'latest' HPG revision (as of November 2023).

[0] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/b77774a89e3fda3246e09dd39e16e2ab43cd1329

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/phy/phy-snps-eusb2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index b73a1d7e57b32cfdfbe314ab938ec54746ed53be..e232b8b4d29100b8fee9e913e2124788af09f2aa 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -437,6 +437,9 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
 				    USB2_SUSPEND_N_SEL, 0);
 
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG0,
+				    CMN_CTRL_OVERRIDE_EN, 0);
+
 	return 0;
 }
 

-- 
2.50.0

