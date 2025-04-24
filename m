Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BAE228CAD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484285; cv=none; b=Ubc2Kq519Tm7zGi9OG8e4aU2jW2oKeuIQakAVthBo+wZ3phVtSiTiKYbSjlav5Mkml1l+ZO9307jMthnScyDfrMJwtnCm3+bFGdov0LBBn4a7G9sNBafZ+xKPYkYwNHs+h3Tb/UNtTTXGqg1PmOK/q2QVqywuYt9funoympy79g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484285; c=relaxed/simple;
	bh=CGJ4lb9gLXqwy9cpqFnBRdCu4buMezQ/KMwBM556iLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VInRzD03swGJT1UACJiAR2y4N4IQNR3tuEzLE6ncAMqDBDSzwabgDHjrF3N5XZkDO1z7LLs54VYead0zk0Ks8QpDEAmIWUWsiO9AQ3+kND/vgFR6EhzX5GpIi9cUyocyPPPuw5HqtOwZwhqbmTm5JQHWuazI0M5MpyRcSHW2sKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fiXBQ5fJ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fiXBQ5fJ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so122560166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745484282; x=1746089082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOV7HKDdI7XaLmmxtuottKdbNPwVla7Cb6o0YW5q+p8=;
        b=fiXBQ5fJ+bx+VX92/PpxRjo+Zab2gLaqPm8JQ4YVEb/xCbKX05IMX0UDf/H0VOKpPT
         gGZ52S4WhtDdOzVnLSH/KK7oZnQR2FI0EWG6TACPAWjdIHrwwbv/k3G6zDZfLrAG+QGm
         shqvvoYEouzfZX67zer2Pa9JM26APdgh/eEI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484282; x=1746089082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOV7HKDdI7XaLmmxtuottKdbNPwVla7Cb6o0YW5q+p8=;
        b=a/RKuo/Pb8Lc/juMWPtxmIQkHC/mwnqnSablvmw+V/OZAR52xDzll/UeGaLestyJ8d
         cvDWrYJgdWorA98tjKW5TyBfFa8NrRWetKBEmOzVpd76y7hAIFfFqam8RXwuAkehFF1d
         e1+8f7PIUoOnugFJnvKlgsAjkCc5q6UI+t/k1xxTw/tCRDLo1qsHB/7pdIhB4oPbL7Nh
         mYe+9XrM3tqCHAKk7pIDvKtHtfrNNKIYEqpHU7gA289W9nUx7FPWNW5osaU9XavfIU+x
         sq+k8/JOaR41FGP3QN0SibqVEeJ0RNSqKWv5zR0Of3k2VqkUy2pJao52tuFyg6H0lxhH
         LaXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXgqWr6QaABJja3K1rF0FeZJ2UbUbiY57gd9F7cjUP2+sigYyPpi0ZiNHsJrgNCwzeRewOcahTfB7E+vQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb69gKPLxARDxYmmaRgIk3WyLQA8/F+r3DYWzPF4tTWclILBDn
	Sj7YGSX7HSDltNpmPkHk5HW3gh9p6mACQewVS+ZorNM8s9iNG+xef0WGpSTSsA==
X-Gm-Gg: ASbGnct353kp5uC7C19tX27Rv731klfAT/Qd0yiL5p8hRtTHn5KPvpKfJO/wbRwfPop
	f3sK9CQFvVq3c+pk95JwwVqYZzRrhpyk4g+3JLbEcW6PuNI57jPPZKZCipO/575KJ0JQFMiAx8+
	E6BatL5TxmvwbKfxOhf7NjyENODHQVbnjxxUuny3TqL6N7vBN9fC9dVlUw5XM/jcl9u4T7M+HS8
	Jw5IkLpjo9jRmaTwkVTmNhGo4N4ZznwPQPbW3bR0Bsbq3KYOKbNMn1K0pzJcZGbNGUl22SV9RUY
	XPKznGmJgo1Nf5QXjgAdEchIHsaJgD9GWYmor9H+BcVgkMuDO8USEBIRM65HusvsEKZgQQUkoMQ
	1UJ5n4UzqQvlyB8KTICO1arUxEsWvcSsdEg==
X-Google-Smtp-Source: AGHT+IGDweb2ftW6YAhGNzGas4oXbYMlgUSzms8AcDFioP7Y4uwQhnokaPl/3DGk+MA365cjpfU/uw==
X-Received: by 2002:a17:906:794e:b0:ace:4fcf:702b with SMTP id a640c23a62f3a-ace5728a3ecmr178033166b.28.1745484281876;
        Thu, 24 Apr 2025 01:44:41 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (100.246.90.34.bc.googleusercontent.com. [34.90.246.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59c5eaf0sm69377466b.181.2025.04.24.01.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:44:41 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jameson Thies <jthies@google.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Madhu M <madhu.m@intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] usb: typec: ucsi: displayport: Fix NULL pointer access
Date: Thu, 24 Apr 2025 08:44:29 +0000
Message-ID: <20250424084429.3220757-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
In-Reply-To: <20250424084429.3220757-1-akuchynski@chromium.org>
References: <20250424084429.3220757-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch ensures that the UCSI driver waits for all pending tasks in the
ucsi_displayport_work workqueue to finish executing before proceeding with
the partner removal.

Cc: stable@vger.kernel.org
Fixes: af8622f6a585 ("usb: typec: ucsi: Support for DisplayPort alt mode")
Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/displayport.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index acd053d4e38c..8aae80b457d7 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -299,6 +299,8 @@ void ucsi_displayport_remove_partner(struct typec_altmode *alt)
 	if (!dp)
 		return;
 
+	cancel_work_sync(&dp->work);
+
 	dp->data.conf = 0;
 	dp->data.status = 0;
 	dp->initialized = false;
-- 
2.49.0.805.g082f7c87e0-goog

