Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57750218845
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123988; cv=none; b=DAdqNMQIvocuuD00JtCQcBkLunhfGUd99f9KexSyBvF7jkHa7qp423v5lQlg7wALPnDr7K7elIYuCq14VquPYDMXeo0Wr2sD//usjrw6/dbFc8aa4SEvSeu4N5byZ32+0CZ8dYirG+uGoMiwrhKAj/BqsCFSiqM+mC3UCk2udXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123988; c=relaxed/simple;
	bh=XudfhlyxDLPOOX1wFwR7UqPkqsd0ooX/kIqejaHNx6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TvYdhf2IMKmL2nok/+sSUlBm/Gr8HL4EhO2je7cGOjwFl7acXwcGnN2RgZUJloSu6vh/19yB476g9HNnaz1A8CEG7BCNRXMzm9AwRtQoKvf4fKTb6twHweAyyYiaGTj9yLspExylk3XwZZzsFrOij/CAI9VpCqbCkgVI0Hjto3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=H8RlUZCH; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="H8RlUZCH"
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 03B963F27C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744123980;
	bh=Cd2ekFBWQxwJj+PkZGNMgt7dWUs7CI9H/DRk609O5jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=H8RlUZCHzrO5pshHSKiXkJFZ4Qs0Ulq+hY9Rk9BL8y5tqPAkqoF08D8AJVyTBKLGd
	 HmCK6EOR3+B2Jsx3bAiZn+hCGiBMAei3BBUGd40JvWUFsb400O8DcxdyDG96WEZv3U
	 uNCRldSlr/0R6vNBwKzmHAymQM2nAw+3yYkgX6Swu5AcS9H/s/YjfuYYdKh1qMEPTL
	 rqb7gl7dul2NR5lxJXsJOt7FdtmPthS3UFz1IPVJmNo0XlY8KeCNW5CEF+LzDZI01O
	 /Dt7WnOk4eBs1peeFugXHCL7+SMKfkpifYrYpD7hC/eZNLcUE5u1KK6AS29gm/3L7C
	 i6qZn3Do/SIhw==
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5e6caac1488so6107718a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744123975; x=1744728775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cd2ekFBWQxwJj+PkZGNMgt7dWUs7CI9H/DRk609O5jc=;
        b=Uub5lHXpQDkh5EOnunVn0vXoGkDMVK35CWxGQkt3AT/QkJqj88oWrNdcc6PkNCET5h
         oZJxJwywlYRS3hxgjaBnWjK9rE2xWZ91R65AIf3QcKZGIOV6TqznxCcxSNpCHynbAY//
         owuUi0QMNYfM3Ew3Q3idubbnsiX+12XmJbRSKQU6bbHBZ9BziizNz4UZtH+DVro4QZfM
         uU72xXmOAPP5QgWESK55dr5Aiw/qlhwASTfZEwRAiY/t5B1eFfWyzxp2bJVG3C8vdzfE
         bwDdEQzC164USqXjvzmQHbxKm5Uc/bp98t4RnlU6Jt2h9HPGwUTbjSdTAS9Pw2EjOrvU
         eG3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZmo8zGSyhMw9x3bybQmWhQVSVjOPOOqSTKBy5kSSnuDvg7q6i0CzrPapbObYc+IrCM/go6rIVolgZ1yk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuuMEbQiWLk5j3vMUvWAL3Yir3+r6LUVZrBaXXinKQ3JvGFd7+
	OF4AQ3ZLV6kP6wLElEdQvAcNjBzpzhrIK+O14ids2y94wvj0HgXzd1advs37t6IZs4OOthby/cw
	S89M7CN3ieLy//CX0L0rpHlw2fWdAS4Sa3NStwPhCzs+5+9RJzvw0u8r3PCBn6TzmiZ39mm3Jl7
	Dj7A==
X-Gm-Gg: ASbGncuqXialRGfDUo5WG1ATmIwDm0Wx1lCADp9oc8HY4QfiuT9SZl8LvyDak23BLdS
	IMXHgXnmq7LZYGIegpwT3UJU98eUOecBUEFiRjqI454D1tdGVRquVC+aDb2/wxvPyjWaSkltnaw
	dY0YbPVvP1OuZqC0ZbovvVdVoI62zdinla5RF3/lgPNQyClfuyIrzm8twoawZ5IClDQ0F3y9CQt
	T/lpmQyx6yZ6x18Od3UtyRza9iJkl0AHUP8SapItA09BNVVgN8GG26MUJmA62Hv/EKAziERYjNe
	CqiMfsp5yYuDJyAXyWLnvM0s7ilqPEIXZfOq5f40woCr7MxIwoHab7q5VngN
X-Received: by 2002:a05:6402:518b:b0:5e7:87cd:2479 with SMTP id 4fb4d7f45d1cf-5f1e4188c3fmr3261270a12.8.1744123975713;
        Tue, 08 Apr 2025 07:52:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJSPbTa1xrNkR3RkKbcBh/Wslpw7BLBT5lNd28/P/EXGJtdBLm56SHFhruqKigf0mxABLrkA==
X-Received: by 2002:a05:6402:518b:b0:5e7:87cd:2479 with SMTP id 4fb4d7f45d1cf-5f1e4188c3fmr3261241a12.8.1744123975334;
        Tue, 08 Apr 2025 07:52:55 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087eedf61sm8050455a12.32.2025.04.08.07.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:52:55 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v2 1/3] arm64: dts: qcom: x1e80100-hp-omnibook-x14: add sound label and pull out the model
Date: Tue,  8 Apr 2025 16:52:49 +0200
Message-ID: <20250408145252.581060-2-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408145252.581060-1-juerg.haefliger@canonical.com>
References: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
 <20250408145252.581060-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a label to the sound node and pull out the model name to make it
explicit and easier to override it from other nodes.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index 03bbebff4576..06a53b3e8cb9 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -166,9 +166,8 @@ linux,cma {
 		};
 	};
 
-	sound {
+	sound: sound {
 		compatible = "qcom,x1e80100-sndcard";
-		model = "X1E80100-HP-OMNIBOOK-X14";
 		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
 				"SpkrRight IN", "WSA WSA_SPK2 OUT",
 				"IN1_HPHL", "HPHL_OUT",
@@ -1555,3 +1554,7 @@ &usb_mp_qmpphy0 {
 
 	status = "okay";
 };
+
+&sound {
+	model = "X1E80100-HP-OMNIBOOK-X14";
+};
-- 
2.43.0

