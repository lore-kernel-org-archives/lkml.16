Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D84221DB2
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087597; cv=none; b=UbNwCl3D++PP1TUahPexAhqf5HDWQrvJ9L1dSMwUw+kEAoD8BxKZ0h6ctD09rqD50pTCLC6YEUGEzpY4oZSd6Os1MUEXpk6t+nmbRaZLWlZ7QJWnmh3ruK5E7BEe5W2xnq+plIfTVdvGM8rngOcLu1HiGtPIyHAQzYG9R3gC0Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087597; c=relaxed/simple;
	bh=bf/jIKWJy54wavTfNSSaWpjCiNxaYawtU/gSVY4rVug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EbtODZvfZ7kwY7+1LLHgnSSP0EazwuGG/ve3MzjS8AKolZYcqmuy0o+poAZze823GEC+kiu19JH7GEmOi6tFafalRgQAA1UqV037v+oA3S3vaJEPuO7oOB7msbFJLMfi7mhuE6OHR+a+t8l3ATB5jGFVgAPVWsYKCFG8XBnlUbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uMLqgMFM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uMLqgMFM"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45310223677so38183285e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750087593; x=1750692393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Usr3pkx4Jti9HJyJ4sLBLWAbEqcjtcuKiaRdX/9yy7I=;
        b=uMLqgMFMYwDgQiCwnGVLfknapO2ijXc3OKsjPpseSat+IH3qHl7eHhQARqQO2exFgn
         4g3vYbzKtZlzxGDd5dusX+8r9tK0n+SSE243mQvSUe40mGgHnuKapov8fABStQa+vPgl
         BPQU9PcnNC+fh5b4ZUMBAfPYrcidSRTNBzRyhfonIRAnLZy5DsOG8XKCXJ8R+cqCjLlp
         GD7H6sUSBdGU/CQVnSjbvcasi0q80+CKBeyqwkVRBBldemrUw3H976Z+EakzdgJyRFXM
         DcsT91xB8c8tCSAs7qi88sUHvLi0bFCapIg7ysuY0Ptox/wwuyRlUD0gYq+3af6NeGCw
         E0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087593; x=1750692393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Usr3pkx4Jti9HJyJ4sLBLWAbEqcjtcuKiaRdX/9yy7I=;
        b=tD+sdkrSDpfSOqNLMtA3vycBpBQknyIjkEaNtIhKw20/Jbg+fzHhtSgYqnKfXuIjDk
         Tjx6qftrb8xIZwWjHE5exYrDUcl5bGDBqWUEiCDRi1zN98aRtJKgb/f3PUvrwjB+VvkY
         bIPtFq1/Rl116FFVccS7KrpvGMEhtgQiQdMIhIZlHCxGs33O73RCsCMYtbZCAppKpAWy
         xWGhZHfFYnvG3SmzHbuWYwu60oJU/ZosuPHHMZmufeNCMvmm3C+/jhUppcmYZXFzlOc8
         zXQTSRR6fSqEqODuM0y9spxF9LgcdQFQnOVvppzfKGqtT+ICVZzNa38FIkmEiPYim4QX
         hmGA==
X-Forwarded-Encrypted: i=1; AJvYcCUPFnY07yKQSNcP5K8VVQ7UEumKjbOXmQqPn9+oqSk4m2qXyy5QlRrkTsDTah6VCwo/ox9Dfc0dw217ILE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx63bNVy2pZea0Caq+K+Pa7J/YZr2FfGrMERSmt1FCeovqp6hvn
	K0KvJm191171/INrahOBKplFmEdjH3txTdG4wuzOmZawdAGPJDy7MEe1NxX7BsugYCE=
X-Gm-Gg: ASbGncuxzgq71HSuIB8Rb7o7/9m3WKBi561h2gndJKK2RK34Zhsq/N7pgGkXqQ7sfd3
	PGSp5e94o/53MEu3wnWEt4bJHOZoblkynXB7OoXofZ6wHZ7A2EGOFerd1oOu1vYqOZZckSY5LZt
	EehVYuyM2zT5NSUbIqTIZ3tTfaMetvcJpJlbT/t3qCLEIuoBZg2idGVfEHOpFPC/bA+82/Bpgw1
	b8vyLx2CpyYoGgu8Wuk60eZcAY9vrVvQXRf3FtQKr/AFhWtKpRgLpWI79Y77pAL8OvVURmA7m9m
	5S+L9Eok0j4xV4U4lzEQgy14dhXtPiY6UFpyx0hm8yd61Z6OT9rTpERNj3LVaIZ6djQZ9g==
X-Google-Smtp-Source: AGHT+IFMr2RJB6+uG8CtORni26fdTnL6TA9k9BsSUZ2ZpXOW2xQPLDMyYb7Lk+inua0Pk4pOegOGCg==
X-Received: by 2002:a05:6000:1787:b0:3a3:727d:10e8 with SMTP id ffacd0b85a97d-3a572e87b1amr6899632f8f.50.1750087593152;
        Mon, 16 Jun 2025 08:26:33 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:32d0:eaf7:ac68:3701])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1925sm151687525e9.12.2025.06.16.08.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:26:32 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 16 Jun 2025 16:26:22 +0100
Subject: [PATCH RFC 1/2] ALSA: compress: add raw opus codec define and
 struct snd_dec_opus
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-opus_codec_rfc_v1-v1-1-1f70b0a41a70@linaro.org>
References: <20250616-opus_codec_rfc_v1-v1-0-1f70b0a41a70@linaro.org>
In-Reply-To: <20250616-opus_codec_rfc_v1-v1-0-1f70b0a41a70@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Patrick Lai <plai@qti.qualcomm.com>, 
 Annemarie Porter <annemari@quicinc.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel@oss.qualcomm.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
X-Mailer: b4 0.14.2

Adds a raw opus codec define and raw opus decoder struct.
This is for raw OPUS packets not packed in any type of container
(for instance OGG container). The decoder struct fields
are taken from corresponding RFC document.

This is based on earlier work done by
Annemarie Porter <annemari@quicinc.com>

Cc: Annemarie Porter <annemari@quicinc.com>
Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 include/uapi/sound/compress_params.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index bc7648a30746f4632ecf6695868e79550a431dfa..f80989f7bdd2f1bfad843b1dc30fa263e083d17a 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -43,7 +43,8 @@
 #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
 #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
 #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
-#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
+#define SND_AUDIOCODEC_OPUS_RAW              ((__u32) 0x00000011)
+#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_OPUS_RAW
 
 /*
  * Profile and modes are listed with bit masks. This allows for a
@@ -324,6 +325,23 @@ struct snd_dec_ape {
 	__u32 seek_table_present;
 } __attribute__((packed, aligned(4)));
 
+/*
+ * RFC with info on below OPUS decoder fields:
+ * https://www.rfc-editor.org/rfc/rfc7845#section-5
+ */
+struct snd_dec_opus {
+	__u8 version;		/* must be 1 */
+	__u8 num_channels;
+	__u16 pre_skip;
+	__u32 sample_rate;
+	__u16 output_gain;	/* in Q7.8 format */
+	__u8 mapping_family;
+	__u8 stream_count;	/* part of channel mapping */
+	__u8 coupled_count;	/* part of channel mapping */
+	__u8 channel_map;
+	__u8 reserved[7];	/* space for channel mapping */
+} __attribute__((packed, aligned(4)));
+
 union snd_codec_options {
 	struct snd_enc_wma wma;
 	struct snd_enc_vorbis vorbis;
@@ -334,6 +352,7 @@ union snd_codec_options {
 	struct snd_dec_wma wma_d;
 	struct snd_dec_alac alac_d;
 	struct snd_dec_ape ape_d;
+	struct snd_dec_opus opus_d;
 	struct {
 		__u32 out_sample_rate;
 	} src_d;

-- 
2.47.2

