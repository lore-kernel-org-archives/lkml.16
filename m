Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D932046A7
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585653; cv=none; b=LmLGagCiz8+Au8/eaPiNF5VUir+vgt24Au64dUEDWxUjVi3F9HG4iS2XhLnyIQ9gSY8WBym1bp0ohygluwf9j/Ga7YBEdhxhNLlz5UN4t8SevNjOBXFTNylv+lTDuijHEEYXqk7RJavRiQMD1uCLXuKLQR2mGYIC9IDRLeiLyoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585653; c=relaxed/simple;
	bh=XXTT/tWxhDROjkut4sJvEGq+bxWZv4Rs7XbeCY5Ewqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gh6cBQhetnOPo1y0GsCJjJATVnJvGMfb5EPBry3xiXohlvvX152gCwLDMO6yxs/cO4tjOWyZ1qj8jUTRhjd2FWkFQXWT9fBPXUV5LV3LqaNQcMhF1fhhtCMXrMaVJUCwNDYKmuKZA5WBH1wPtcLnEUI7z9u35Tu31QcltYCZVuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mYJba8qh; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mYJba8qh"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-46c8474d8daso31098331cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 04:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738585651; x=1739190451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UyBErLHGx5G6ormV1VB8YFEdyWYN72j7JODKBi0RF4=;
        b=mYJba8qhsOCoJya0nvTmeeuy+dXdJwQfDYKiJGFYJjTDMm6mTqnD6qfoBJZLqSKWg8
         bluJuXY82E37XCR2vS/84mLnxlldGmaiIZgAzklLVHJUws2J4zx5G0y5xnM1VRFLRXV4
         sODygUyf+gIr1JIsVq/1NL/0rW+GRMljl1nOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585651; x=1739190451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UyBErLHGx5G6ormV1VB8YFEdyWYN72j7JODKBi0RF4=;
        b=XsuZubQ3IiFIDo24L/fEE4InBoHE17PikU/9933l7KWddSYPliZanxwf5SRtR2XfM/
         I8yfL8PmzpxjVqkcfrpfyl5hRV43nrY6ewtR5Tt7xeqSQWD45yultiP2csREdLLgG4BS
         SOZR+lfSF8A5yeF5S2FV43iPelKZW2VmKksIC14N2in+bxoJ/BCYo2Ww2rZhx9ZaOg0z
         qUb5i9XG2l2fd7s4cdNm62r60YnRxl3keg05i0bcXZZGkBDyFzEkY4AGgqGDEGbiDa01
         ZW3YBKORCkLEVxc2YS/fEL+hYHqx88GRePw8BTn+p6EJ4IfuDUjk8K3tAOxKl52jgPyc
         csvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5ZT77pULs42M5XJDypyVSXrO5V0U0mYUGaTPU0IYx2WcIkfEUh3zya/d5qgt+kqC0Y7hRaFb+LqXw4Sw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYQiuN7wP1dNZrzSOw58dejb4x02PW1tYYt9Rn+v7vb+Dpf1Z5
	fP4MazY2z9H/jthBYolrM4Zb67tktyJ9WQ/hGVdz/2zkkhXtuDfm/qArVTWNzA==
X-Gm-Gg: ASbGncs1On29HsA2wl5NbxV9uq2UE01wHfE6Iicryx56geVZbgP5CDetaAhHDoPh1Vq
	UtYDyj1AVALqtVQBNgAa0jZpuuwIU70cZDKYtAeGtBHYo4Z36BRkEwj4DV7RfS91ENR6nwYkAIs
	xaEqcWuZEn0mLAlaZ1nG50BQ+girzOtoPs8q6pvx1D48P1uvQpUPb3SF9fSU/uHsGcjEQeoP+Rm
	fdnPm5oIvEr7iV0N1DqC+rnIf7NM0VvoxeNjGWyj6LS69PcY0iRdmnhmRp2F4JGCKh01ENX1taX
	rbKKVergF8QNj8AjimcH7+h5mt6FeF7st8aUtGU93U8i0ezkZXtCz5AXqklq8XKVSw==
X-Google-Smtp-Source: AGHT+IG9E0NH+LYROfpL2Nq2MBiFHcnAII6p/7ifysSOUvC6cvXCw7X7TxWgfCpTwJkAsyCKZgKCJg==
X-Received: by 2002:a05:622a:4296:b0:467:681c:425c with SMTP id d75a77b69052e-46fd0a806f5mr333036041cf.1.1738585650743;
        Mon, 03 Feb 2025 04:27:30 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e0c12sm48240941cf.37.2025.02.03.04.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:27:30 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 12:26:22 +0000
Subject: [PATCH v2 3/6] media: uvcvideo: Add a uvc_status guard
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-granpower-ng-v2-3-bef4b55e7b67@chromium.org>
References: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
In-Reply-To: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

It helps will help will the error handling of PM functions.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvcvideo.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index bc87e1f2c669..be0817da538c 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -763,6 +763,8 @@ void uvc_status_suspend(struct uvc_device *dev);
 int uvc_status_get(struct uvc_device *dev);
 void uvc_status_put(struct uvc_device *dev);
 
+DEFINE_GUARD(uvc_status, struct uvc_device *, uvc_status_get(_T), uvc_status_put(_T))
+
 /* Controls */
 extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
 

-- 
2.48.1.362.g079036d154-goog

