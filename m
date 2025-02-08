Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EE71B4243
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 10:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739012020; cv=none; b=TBDh3clmM8oC149+/4kdTsDymJrZS6w5fMVuhsr/P22s0u52Ns2407rNPvvrqsQ4K9m0jgc9+6iD5WIJ1FnJRaj1CWlZLdv2ZWgXcCRiVJcR6FU9llIaNUZk8YQKIzoR69A8s2ceeyyz5LYP+u3gjFQVut0fY3uh9Kp14mESmLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739012020; c=relaxed/simple;
	bh=hnqtuDOvE9KKTntRQWNuuRASTIzRapspAR7WuG2vANQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=md+mMC0x4Ma8cgj/h96kPyemIzBXDYJzeu7qqMSlsQ+EHMTiI5njl7ReEfQ5BmfLj+nrgnmqexG9yBP+LKUtl3XIw1QiRjqtvYIJek8AQfV0g2VXaDK6wZ8geqlJKez90V4oYreeK8f6ZAWXMYN1JxTMG8FmBtjibLqYKEM+eVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=AKBOQDBI; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="AKBOQDBI"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fa0c039d47so4034060a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 02:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1739012018; x=1739616818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbs6wjnY4vaySC1A59WocF0CXdHs9avCvrqKoElPFA8=;
        b=AKBOQDBIiq82PtZnEkwP/R4LydtCmedKhjDRTUGx0X3sK8vdRdgNc01H7pq3Ba9bI2
         aHbPAe9Yfj9IYhhk0AOt53ZmkTLf3lXvHHVBAfTvcGvRoeUjwpaOG1S0P9slNFNwEFAq
         UFaX+4pk2sd0VKGGVbqDSqVOER8Ye+teuzthSQ8uBOU/nSItlUzRy78YM36W9JpQ3niQ
         1R/Hy8ADUpRPvO5PYtgoKSC+7zOjKozjn1HFxHvm4nvwkbWmFLLuk+pbJvfW91SkWTAG
         xBJhyo+ptKjFy28NkudKSqP2cLG/mjlB9iPuDRWS4nnie/ImL+U9mvcZt2yH3HpEkA99
         Fk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739012018; x=1739616818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbs6wjnY4vaySC1A59WocF0CXdHs9avCvrqKoElPFA8=;
        b=ObEhRqhPi4MFkeZExVog/fh3NRK4rNrBuOCFK7k6s5YhSnEGkcOuA9H4ceQcoUjWrZ
         fGZD9dRsAu+X6gDUukCYjXUl8rMiYPx6FYliLyGFY1TFtr6DXN1p/t+MjAUZb1eqx0m+
         guj7j31KKA+BgU6zo7jr74om0yQIR7/foDcyQvxSnU1NiiR5kKvmIUIOFV9nWEwvaTSM
         zQSMDJY3cNWSgaq7fN9SzuaZg3njYly3i9IUXeHw2p10tTlLKaHKjIpkOpfF74sdz9Aq
         cQw2M9Dq0e6VoqBp4kiMJeT+t/8bz0i5k6m7ydE8dJxfw3FJ9NThdNV7jJIkChpOyCfE
         EWpg==
X-Forwarded-Encrypted: i=1; AJvYcCUpUZ5YlzvxjkNZj/PYti22eShTfiPnwkMpgehuy7cCGxj9e8WtrqJA4ZV8W4MrCDxabnqa0y/dpd0xYRo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze0TPU185WLHLqjS8rapQ3YdUfVhoW8N9Q/ZXPAc5ZyRon4c3w
	BmU+dRR2N/eiLRfXxxEmwGgq6CSjub6SZmZW7K1yHcCwb2f4Ub1Im0qBLidbjPg=
X-Gm-Gg: ASbGncs0PLH87OQXOeY9V8HxlWQZj90g0SvroBEPosgBQb/2JBMLel6DtHfVkUumn1D
	InZ01f9CyZUuxN6Hf+J5E5tb1I6XaQc2KuIcIGooZT7Y5B/OVDASU/w5tJQ8ejhElRkBdte1cLz
	gozfOhv3cE4gIj4BPtG6CtIAbEyAdc/0LfXGjdG40dVAHj+JqCMbdlvFmVt7Pd69LWe5phEJ4ef
	2qTNDkzThPUEApQpxb/LV+xkXwzOEX5DwjwCec1XVONbTr/BK+W+mONYFV0lCCsPk187LJYcMqb
	FU9ScUUBT6i8E59kOyonwX7EY2VCb14CPfoekmrYxWXqEgK+42CzKSBJ1HEQb/g=
X-Google-Smtp-Source: AGHT+IEV5Xl0wWYrSrkRkZ1oHtQxnN+LgtfamxZdI4uYbBB3qhpK+ue4hvRde3hbMze7Nvuo6PH1TQ==
X-Received: by 2002:a17:90b:4aca:b0:2ee:f80c:6889 with SMTP id 98e67ed59e1d1-2fa243ef19cmr11273338a91.33.1739012017749;
        Sat, 08 Feb 2025 02:53:37 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa36f185c5sm2142003a91.16.2025.02.08.02.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 02:53:37 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	thierry.reding@gmail.com,
	sam@ravnborg.org,
	dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v5 1/3] dt-bindings: display: panel: Add a new compatible for the panels KD110N11-51IE and 2082109QFH040022-50E
Date: Sat,  8 Feb 2025 18:53:24 +0800
Message-Id: <20250208105326.3850358-2-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new compatible for the panels KINGDISPLAY KD110N11-51IE and
STARRY 2082109QFH040022-50E. Both panels use the HX83102 IC, so
add the compatible to the hx83102 bindings file.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/himax,hx83102.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
index d876269e1fac..e4c1aa5deab9 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -22,6 +22,10 @@ properties:
           - csot,pna957qt1-1
           # IVO t109nw41 11.0" WUXGA TFT LCD panel
           - ivo,t109nw41
+          # KINGDISPLAY KD110N11-51IE 10.95" WUXGA TFT LCD panel
+          - kingdisplay,kd110n11-51ie
+          # STARRY 2082109QFH040022-50E 10.95" WUXGA TFT LCD panel
+          - starry,2082109qfh040022-50e
           # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
           - starry,himax83102-j02
       - const: himax,hx83102
-- 
2.34.1

