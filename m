Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7362023535A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568460; cv=none; b=YJVZ+cAB6VHjBW/sZjCwitz8GPmhnf3dfB7yA+LExRWUvUhDAGtlMXId59xFEIEUdkFosN+3fimygK4U0aneI1QXevr4Y1B2XZ6lPYAD17gf7N/1N9F0HhX1MGyF0VeYJvH6qP5te4qAM7dcb6v7Y9XThQV7Svu/UZ3iZh6zNAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568460; c=relaxed/simple;
	bh=b8O4l3RSvg0fy+NWpm7X0oPQjhPePwQH1mA0z4k72Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A1dqIKBxwULZdXCGT24FD+1MjNnbf4GpPoKh489tSVui4T4xtWTvsEdvNzbWiQyaBa4I9t/3uh07BWmYxNaG7vvjbxNx3nXScvNjVpvT2DUMNmreNo9jTUnBOxnEYQKzg5dfQXu3boAl6RIhR1zI9YEJG+7fmaY9I9ncsi3vi1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cnlLabIh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cnlLabIh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso18380375e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568456; x=1746173256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WC8RFGmD1RHEB436RAA/xlbqbziPuzDw03yfjSeC4YY=;
        b=cnlLabIh5/IN79utqTu4xLOQGjhG1zVzD5iUunpEnChrCkS54opeJ5MNLkc3XVogUZ
         wolNa2kY1IrJlamFaKgMY8/+liPY4lE0njbAqTbydpBx+YcGqEYAYRr4ov4sQAe5uy/J
         A1egddJMEov0RBiuCVZlsrKv3sqWU58bQIK7VA3j9ydRcifxZcnR1gUX13iR+L5j1zOG
         0VWkA1fG04JwsK8djGuOODcPqHVPmVtJ9oJR7a0oAWlatplvwIF4ACCJBcFLIOqL3rnC
         wQ1NlA/rc/0LOjxRZvMX2muPab6xyE+5P9cjOVdSY5R2lLcvmUdd7VKTv495A9vLVNak
         J68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568456; x=1746173256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WC8RFGmD1RHEB436RAA/xlbqbziPuzDw03yfjSeC4YY=;
        b=DTPvMlRrWDDd76Fg1lQp4FN/kLoGiU/02KU+1ItwbYS/Cm+emr76C5j2RjEgEyoBmv
         HsBwiqiRfWglLMMjtyPfNgwaVkQP1/RJ00k++K8RVDR5ERSRD/tJ0z3ZUnr9ue2WVw5L
         NgKOuwPW77nPd5mTKwTCQ3Hm5NeG2iKAdst9/Q/oRHCczcvstJFwm/anllt+0GlCDNWF
         ZjEjjqZ64d6lUXylQjQsC/AMTY9vJEcV1nItEeiDxffC1Qe1u+re/cf4SnsJ0gM0nuUr
         d4dgQ29y3zIh4a5pwYot09drSgJp/iSOruz1gRnYWg744fzKMukijydQcRYUAZhUKXy1
         uJzg==
X-Forwarded-Encrypted: i=1; AJvYcCVJWXkARfL8AMzCbnSozgv8HxvYd107MN7fxneBPGHS58LAo//rn2YMvyOmMdudDRE+ocS9gQf6WFR2oMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs+Hrtqf5F6GjOIlmhLbbyg6wr2kdr+zGqwcgXqca3l1WNmQWw
	ErREi2V8r+6bB+0zdFtOkub+qV5PEs00ClDFwZjTJEZI5dbN7obPEnxYqzrcavlXzwP/T24ILlX
	q
X-Gm-Gg: ASbGnctjLfkp7nHVnyBtZyeNiQsUHqbF+H5du2OSyJCBeSSATdvd2GKkp6npFkuAKG5
	7+PQ6+dtrsY3qabvx4i59301EBKVJfCvmq43intssoP6r0A74I5uHgW+NYTxnOJ93tX+iEevith
	MMlwcNr+zEv1+iOmgYqEYVOajq6+h7GPH6IYHZvpw+7swUO8Jvq74+S9QrzoCJE4f3kBHnewoFG
	G7tnrhSxYGj7Qg2BlnvyTVx/C84fXODSVA727aW6YywtCPdKLAZ3Up9xMNhQxM6xJq9tJNtZImZ
	KqbITBVu3hkg1cFSbseL+bN81Hmpron37zyBU9A/5clqmt9MGTAV+x8VZcYaVjlZORJmWk6xcap
	pUTneH59NkSOOj5/Tk/54NY6yXe6V/0O4nSh9dBrCz+OchrHtpxYDrFQ9
X-Google-Smtp-Source: AGHT+IHnGU5E9kdTmOEv3J8nz+wIEIG5a+AbZeoA5daYiMBxcw7FiKXP7Z+blV7YWaSaCVLY5aXfcg==
X-Received: by 2002:a05:600c:4e88:b0:43d:fa:1f9a with SMTP id 5b1f17b1804b1-440a66ab7femr10627065e9.30.1745568456199;
        Fri, 25 Apr 2025 01:07:36 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 10:07:28 +0200
Subject: [PATCH v3 4/5] ASoC: qcom: sm8250: Add Fairphone 5 soundcard
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-dp-sound-v3-4-7cb45180091b@fairphone.com>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
In-Reply-To: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

Add a compatible for the QCM6490-based Fairphone 5 which can use this
machine driver.

As a note, QCM6490 RB3 board is using audioreach architecture while
Fairphone 5 uses pre-audioreach.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index a4bf6eff811ea3e2b005071cf3410e5a0410f5d8..43c93e24d77259f232062c7e4182a39151111c59 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -208,6 +208,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
+	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },

-- 
2.49.0

