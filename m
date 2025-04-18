Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A84214201
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744990952; cv=none; b=iBacnTOmJod59N7owLWWgpDpo6GtToOQVzf4QXb6QPVnVk4LQ+ioOHps7umeIrqhGpfnGo7CrIznkAetTDCdRVRiTA0TkTz5fEQsp81cnbzbJmb3btxU7++Vx/N38fG+Vtm/d5t5ZVNQ+g0wiI2FzPL5oNtsgTQb9sohGOvHv3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744990952; c=relaxed/simple;
	bh=chPzjK0Y6d/4/rESwcFrsvyNA2pkcRF2YGDzqvtbNg8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ltlKy1SirDPO0y0q5HqMfdvj35v/1kZOSVTw4FxRNjfbUdL3twekOXV4RcrfBZAffYcW8EkiupYV9VYO4lk1zROpdmhxA8DUoKnG7aowJIXG1OjzldCHp3TXVzDdTd/vTxcRDcwSZ8Sx+Qs3/u+d323jgUjYXUTlEsN77XgQsvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSZ34c/p; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSZ34c/p"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39ac56756f6so2035780f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744990949; x=1745595749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0b90C4lr8yP65JgT3uHcE27HOgYLSSWJG01aMf2J+lA=;
        b=HSZ34c/p4u+kaLY/8FkiRxJU+8geOXd43bNnfLfwId1DKZsKanuKsTzqbOYhniBXTI
         6P/LIXXdXyNZktgO0VdhFRBsKZJ20ygvDNJ2nXn2fvg352lfTjEHTcjGmlUv2kbKnH8m
         jV+ITTaFhz1GgoiLnz+bOdngoFrLo0U/wfSwvNuWL/Me3e9YYVjoqVvsKJgKhMh9uhDR
         erWaYliSoidgsDIo7msT2TnQgPBCM5PxRYMh//iBoReHFvlXozTUI/fwnKgk4GSu7UI1
         FDoqUm25M4DsrjkW3o1oa1SNbeC8yO6PST18NDF1N+xwGTuf0wc3jkCD0AZZHq+ANPnR
         OjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744990949; x=1745595749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0b90C4lr8yP65JgT3uHcE27HOgYLSSWJG01aMf2J+lA=;
        b=bZQcqbEiKm7NsksGYsaupl+S7Xu1vtS2orY1CIBnhbEGRaaqfq9oF16uV0z75TGKZ6
         Lyi0cXNXCSKEc0KE9FxOpoCa+DykSbGqONII2gA+PyDRaP07K3afxBu6J0vcf524fajm
         aUxuvIpzu0EddrPLFXWhUCV6cPcNGRBWGyY4Uu5ZtAQpD7IaGGl5y1n4YAjEKyC+BbP+
         pItlruRD1HHfHwTy5EJesNzor9sOBF/H9XHqxs+WP/r6rrmcBXVh3HQ9EACzMeZ50r+d
         gq8eAqbqtyVFb296C79MdHKLvlL1x3tTW1EkdQ026XQfmrQ5D/zhC2wAh6dZh6vEtBJT
         xoKw==
X-Gm-Message-State: AOJu0YxC7YQaneZwAcOH91YpkEbq9AsjlO5Pi9vfSqtoARIYSjJvE9Ja
	nwBapkU4mjI+fvfTev5FfpjFEFDuJgGNUNwho8CkX3ivEN3gwrT9YIrpE/gYwS8=
X-Gm-Gg: ASbGncuvopHff51a9DwZ4AcIp/MQTvB41Nfe/wKQOuajkOPa91drMaqE3l8chkb+KQu
	SqOxQAhuCmgZ/xbb0EiFjSljCgJ4CNd8JgLhcGoLiwTWRXEjT5gDmY7ndNtpcf9VYtLhKkU7Ib9
	pF8Nl/Eh4RPLH5fI8NmTHv7zt5UP5dzFNcdvC/egEY3sy/Xx9x9zhZgGDEKjsGLLC85aMc4Rq49
	Oyxges1HgpKgcPFAOqBuFpovP7/8r0ZrrxVpydF+y1BxKzT0AU7VCJuugRLEW1XFz1c7LlGOJ71
	UkgI6R3BpXV9Akpz5vkHtWTwETnfKqpyY7Qjaw==
X-Google-Smtp-Source: AGHT+IFz7MKBqADDjiLz0R8iijddpAAhVZVxCPRJR9FSy4ojOMYYkYvkqtBkxw511//nnxrOkwkIuA==
X-Received: by 2002:a05:6000:4a1b:b0:39a:cb5b:78fe with SMTP id ffacd0b85a97d-39efba8a4f4mr2270637f8f.34.1744990948698;
        Fri, 18 Apr 2025 08:42:28 -0700 (PDT)
Received: from ubuntu ([102.88.77.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207basm3059496f8f.5.2025.04.18.08.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 08:42:28 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: julia.lawall@inria.fr,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v6 1/2] staging: rtl8723bs: Remove duplicate NULL tests on pstat
Date: Fri, 18 Apr 2025 15:41:56 +0000
Message-Id: <016d5429e5db0596a4fc8bb25b1c23ff94ff88b4.1744990405.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744990405.git.abrahamadekunle50@gmail.com>
References: <cover.1744990405.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pstat pointer has been previously tested for NULL after being
initialized as seen from line 970-973 of the file.
The first NULL test is shown below:

		pstat = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
		 if (!pstat) {
			 status = WLAN_REASON_CLASS2_FRAME_FROM_NONAUTH_STA;
			goto asoc_class2_error;
		}

Remove the second NULL test to avoid redundancy in code.

Found by Coccinelle

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index e74fb7d5dc37..863c188a3cfb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1323,7 +1323,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	spin_unlock_bh(&pstapriv->asoc_list_lock);
 
 	/*  now the station is qualified to join our BSS... */
-	if (pstat && (pstat->state & WIFI_FW_ASSOC_SUCCESS) && (status == WLAN_STATUS_SUCCESS)) {
+	if ((pstat->state & WIFI_FW_ASSOC_SUCCESS) && (status == WLAN_STATUS_SUCCESS)) {
 		/* 1 bss_cap_update & sta_info_update */
 		bss_cap_update_on_sta_join(padapter, pstat);
 		sta_info_update(padapter, pstat);
-- 
2.34.1

