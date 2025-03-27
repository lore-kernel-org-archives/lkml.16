Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118EA1A8F60
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070003; cv=none; b=hFyRfTU5AmlKcaJhnWFDnN6gt7aQ4EjM8R+1hHUPsZzbRrrfC7f67W2gjWJbYK/Fi7ZmbT41R3VKXRmnPnb9KGKDmpGO4TO5bCvcN331wUpTbh/vt7l16yb4hVQZO5i4mZthHoR/G6Ah6Zd1DdgJuNtkOB9OxdVS4+YIm0jXJtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070003; c=relaxed/simple;
	bh=8S9e6bRbJzlf32iYNYG1VHGj9YP7JA4gMmMOneOUa0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qZQ5k1uGnH/BfU2tL20VFHzxVn/voF8KFTJ/d2x1L6Dx2uH8QaLHjGJ9tnsyczd4pPU3Dt4t9ffOvCHCMr0vdXuaBwRmRvqoeCwL9AFs/D6Z8vhFsJvXCmz6ss2Yvf8kcIgA4YsHBFWYjIU5y7WdXF23/JgQOQq5NqVz1D7DIjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JSW/2Sau; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JSW/2Sau"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3913cf69784so515761f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743070000; x=1743674800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3+M4GNUUBAuIh9X1Zg/lIAFPSa4InwqS6apGLD7pPwU=;
        b=JSW/2Sau+9vnGzsRJ/rShVFtS2xCJYCd7IMYrCmnXsgzt6appo8e9rpTGtqyI6mdaP
         JsV9tBG2BmzLchmspOONtcap7CGw+zC4/4dqGXkSm4OIKVfP0CPHfHZjcRsO42/HBm53
         b+lxs3BewC/Obydi3EoirwnBFEIMh8M8jwLZpOd6e6v/8XPVWEur3v4vJ8G3+ffBPdyo
         ATEaXd/ys3bLWCx6waTqeLklQ9ZlKltAhKHWbYBV8O0rYyFG9Qd+e7Jvvd3LRYMJzBq4
         /L26oVg0uIbQ/BI3fDTs8EBzuXaPNxTaMDrtVZHrPCkkv6pQoha2G4UiS0dhfNUwALJZ
         HjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070000; x=1743674800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+M4GNUUBAuIh9X1Zg/lIAFPSa4InwqS6apGLD7pPwU=;
        b=XYmm/Ty8JrEQ0q+HJXS5YjOXVOs3CDBC+fXsqP12VWpOLaYCYiQ637jfT7z6JgzMMY
         1mO92gWhDaYaW8rEiJ2hVXlajNh8C0sHxJvJSEW7IWloSp4tn1g9mCu66BaQgNiyNO2C
         pbZ8VDnWFWg5QFhT8K/JWzllGkzNry9wzhRQ/lW2PN7Auv9Hi7OnGe434OLkIAZYXKK4
         1Eb29GJ+6AW1nylXsLdKYGf3nxa7XEDKqHTf06I5dTKcL63axyzhczBpXAAAKPvNC1Zw
         cCWyw/wKB+l/O87aIe4tpTyy52BXDeED7c5UkEn1+gv4j+7GBRD+NwlWi5JfJwFjfcZ6
         657A==
X-Forwarded-Encrypted: i=1; AJvYcCX1xI4G+CZPW0v1P2IKOkm+/jMca9ad6gHx25Z0jbVdmV9mFtwBZT3KtOKkZM6K+kvm27+zy/Oh6pF6+BA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdGh1vOqcgjEijmqROlVq4J0I15j/M59rhsn3DRnBnF3jpN6js
	vBDRifS9I5Ccwy8ZJ5WBgbggJwEPtg1la7k4s26g4LpcqbICqLYat9I0+Ssc6Us=
X-Gm-Gg: ASbGnct7y5TmwIE5x0wx72j29z3PW1rkZeUM9+SkkkxRn6FfnhtRtrt6/doZn+ah6Wh
	JwB7kC1rkVv81d2eefeOk62mm+lf16gnXCiOvnnao6VV6xYn3awlCjvLqOdO/76SDRlNqsJLwmZ
	XtKH5IBDorFbxVseptK6MJSm3BMKWFoigJztEnlEB1raKEYlNAJ6zDN05/8nAF6OnYw4pNCe9T2
	6+472yxWP74ymJx99N4Kzl8LZY9/i5m/9y6zK7YhkOChcbqiwhbkkBCLKvvwXrzpsy7QvBqqZhz
	BdyjY9YctKpS2TvqzE4P/hnkWwj+if5Tuh/pt3Wm2VWIWEdtg1sb5g4Wvbc2Tn7FzivTDQ==
X-Google-Smtp-Source: AGHT+IGF5C8wwArWoaTnvg18E6/GcMnWhwo06yT5gdG8w6E8bc9L3nKzs7+GFZLtwrNmL7hDXvjOFw==
X-Received: by 2002:a05:6000:1889:b0:391:3124:f287 with SMTP id ffacd0b85a97d-39ad174b759mr2590951f8f.16.1743070000129;
        Thu, 27 Mar 2025 03:06:40 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ac3ce3dd1sm10843204f8f.88.2025.03.27.03.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:06:39 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v6 0/6] ASoC: wcd938x: enable t14s audio headset
Date: Thu, 27 Mar 2025 10:06:27 +0000
Message-Id: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Lenovo ThinkPad T14s, the headset is connected via a HiFi Switch to
support CTIA and OMTP headsets. This switch is used to minimise pop and
click during headset type switching.

This patchset adds required bindings and changes to codec and dts to   
tnable the regulator required to power this switch along with wiring up
gpio that control the headset switching.

Without this patchset, there will be lots of noise on headset and mic
will not we functional.

Merge strategy:
- mux bindings and mux patches can go independently
- ASoC codec patches with bindings can go independently.
- dts needs can go in parallel to Codec bindings.

Changes since v5:
	- add flag to check if mux is selected or not and conditionally
	 do deselect.
	Also proposed mux exclusive apis https://lkml.org/lkml/2025/3/26/955
	However, this patchset can go as it is without exclusive apis
	We cal always do the cleanup later.

Changes since v4:
	- do not rely on as-is idle mux state, exclusively get mux

Changes since v3:
	- rearranged mux deselct to do better error handling.
	- reused mux_state for gpios as well.
	- removed tested by on bindings

Changes since v2:
	- udpated bindings as suggested by Rob and Krzysztof
	- cleaned up swap_gnd_mic callback
	- updated mux gpio to use dev_err_probe.
	- added Tested-by and reviewed-by tags 

Changes since v1:
	- moved to using mux-controls.
	- fixed typo in regulator naming.


Srinivas Kandagatla (6):
  dt-bindings: mux: add optional regulator binding to gpio mux
  mux: gpio: add optional regulator support
  ASoC: codecs: wcd-mbhc: cleanup swap_gnd_mic api
  ASoC: dt-bindings: wcd93xx: add bindings for audio mux controlling hp
  ASoC: codecs: wcd938x: add mux control support for hp audio mux
  arm64: dts: qcom: x1e78100-t14s: Enable audio headset support

 .../devicetree/bindings/mux/gpio-mux.yaml     |  4 ++
 .../bindings/sound/qcom,wcd938x.yaml          |  6 ++
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 25 ++++++++
 drivers/mux/gpio.c                            |  5 ++
 sound/soc/codecs/Kconfig                      |  1 +
 sound/soc/codecs/wcd-mbhc-v2.c                |  2 +-
 sound/soc/codecs/wcd-mbhc-v2.h                |  2 +-
 sound/soc/codecs/wcd937x.c                    |  2 +-
 sound/soc/codecs/wcd938x.c                    | 57 +++++++++++++++----
 sound/soc/codecs/wcd939x.c                    |  2 +-
 10 files changed, 90 insertions(+), 16 deletions(-)

-- 
2.39.5

