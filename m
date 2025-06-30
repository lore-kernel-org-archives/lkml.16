Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FF328C2CB
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292792; cv=none; b=Ewm8/c6LKAzCph4Sr6hPdy6ssfqfDRR1l9l6bjkT9+ELZqx9Hj9RcIyqVCzIXKa/K7LlCQiASap06Irb4hY9UqflNZ+3lkMQ7APeGCmbHw2PWOHLa4M3VaTJk8qpegA3STeAh6ISP69zE79Ujt2drcoKiZv3gaRczp/i93+xqWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292792; c=relaxed/simple;
	bh=9YO6vTmmSzYJ6+ilrVSIaHhLFOqDRbwDZf1V4ontcm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PIPG/80bBBvYVG05hN1u3OceogWNw/fkidjbndAzhvrv7U1LZfcrXgpdMctrhqJF0x+WzrFN15iEdO5utGOEr/YyGo0tbcRikwA0IFyJpI/SxBv0MQrlAVlFJ3NekGbYA7rli5F0WDQcJ+asjttCB9T95u+OzV3uCmovpInPd1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SlsrfnWv; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SlsrfnWv"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad574992fcaso365800766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292789; x=1751897589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CC8cr4prgnEYpYc0c9MsVzaUXE6Rfq2YIvUMxEgcago=;
        b=SlsrfnWv/n71EU/XLE++kgqad00Hw2+F5RQzdHjwKXwrSMzWMPW6zE5g6e5ndhOCta
         yD8dP7bpdpc8ZheLy2K2fK2KiFlxSUT8dc2GjiHNfGx/saMcKTlnjmOAyfnW4tJYCF6X
         c/tSkADwE5EK2ed5vfwnAkAhCAj0cEBK3E0nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292789; x=1751897589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CC8cr4prgnEYpYc0c9MsVzaUXE6Rfq2YIvUMxEgcago=;
        b=ApdaANbMEgGcEjHM4C3BEp4NPO5MSEdd4VoU8zex1441BzSejb83mVJsv1Ao9tbFUF
         nYKsFRi1HhZLO2fv5sTIgQLSELtjgzGYfVUCa7VqNHRhNzXJoV4W35dHIiE1ym1V2N3d
         EBANxN6s4XDfCgoQBgPSDjQkXHeskfWU2BSZM7KTLL1WNiu0tYbCWt2siPC3XLDwgqRN
         O4dWzpq0zLNwWdKtCZhZwrCrghisNRMOE834+olSPUNsoejmt4Zaycqy9wZsYB+QjLQ/
         hjiNIWVLuXK1YSK7WHyQmvtoxX/VwuN3KfHE7ZjiONdRewX8FMGRBtspd/zvgLJgee/V
         IjbA==
X-Forwarded-Encrypted: i=1; AJvYcCXORl63GzDJ3FNoGzf+Dctq7r15HhZij3UaHJrm+u22WZhZlKabl4B02n/2eNXVyoZkfkd7DD1DNjMTKxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU8LELroVvxvsNPeNP5pyZOCgNbC5XAM2ODtih3SmHtLvycgwl
	QIrg5kzQiAf9Tfkm8cULlTH3GebvHZKaaC//OkHWYlnoncqo2RQXeW16Ady4teufRA==
X-Gm-Gg: ASbGnct/eytmU39DRSZZmukkzDMQhinQ9EVlRfWdFdOUtd5yr5BHYpiVebyWdmH+UMB
	rlRiKGSQCCYtcq/ijXnLSx90lVNdlkb1n/jdtd6JFHVpz+nefnLjA4iWwpaB+RJHi58dMRp7yj/
	ASiXtwoloN5hFuHrveMrLluRcR5dsJo3ubWK9ucFATTjZd2L+R6NSM/bW9GSS5a3cK9ERnTSd0r
	fuyrBmgn+bYGwVJurOcsrBZ2xg64mrTXKsY1UPgHO/FP2Lpv1mys4JMICE6Fwcw1kpFpF0PnPbd
	GNGUokiKm/zpNZsYp8GsnESaWy4z9v/pV+tvTUHWw3Drh17NiAAd4FoWCl9cJfcJqMKlnLavPfB
	EGqb+ZeGeRgBd1sdCSuO57ePt/RVZtdenXoldayy5WhEznfOZtCmn
X-Google-Smtp-Source: AGHT+IGAPr4AL+m9Q53Is3hbLm4DqSgPBqlFVyHvgBt7nn+yWfXW/dahX7CBUSLpmXWeZqCzkyRaOw==
X-Received: by 2002:a17:907:1c1d:b0:ae0:c803:c96 with SMTP id a640c23a62f3a-ae34fddefb3mr1305940266b.24.1751292789206;
        Mon, 30 Jun 2025 07:13:09 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:13:08 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 09/10] platform/chrome: cros_ec_typec: Report USB4 entry status via callback
Date: Mon, 30 Jun 2025 14:12:38 +0000
Message-ID: <20250630141239.3174390-10-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250630141239.3174390-1-akuchynski@chromium.org>
References: <20250630141239.3174390-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Type-C mode selection logic requires feedback on the result of USB4
mode entry attempt. Call the `typec_mode_selection_usb4_complete()`
callback to provide this final success or failure status.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index a4f338771094..c5a7f42ffb5a 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -698,6 +698,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 
 	if (port->mux_flags & USB_PD_MUX_USB4_ENABLED) {
 		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
+		typec_mode_selection_usb4_complete(port->partner, ret);
 	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
 		ret = cros_typec_enable_tbt(typec, port_num, pd_ctrl);
 		cros_typec_tbt_status_update(
-- 
2.50.0.727.gbf7dc18ff4-goog

