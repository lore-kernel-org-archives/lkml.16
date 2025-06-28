Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFDA2BCFB
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751133503; cv=none; b=tbRHhYBWPetQCpgWDseCSrRzTwXxcoKaZj4OKkgB1GbCwD4n5tceTb+TF/2/GW6+47daoLT1nF+oAcfRtdmorP3X3shuLNt8BSTApFsrdoDTnXIJby3c24zaNeALFOfLwCq2f1NobkqEsZa5olV25dVYw/aWMu8gVJdT3j7wyEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751133503; c=relaxed/simple;
	bh=OQCmMPA908QX9UGJajlcjxE2kt5yILn0ZpbTN56zlcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lHHAKU/1ho+Id2QH/pyqR/tvShmoG1WpEbgrnRe3HAiUaPPNjq+JJFKfzv2kNmg+auKBsHVJj4JYrlK2sjtwOBv8o/43XizmFYjb3B8GhPYRffJ88gi8Am3gmfPaM5z6A/bikeFHM+nSJ+vSL03rU4Lpkle2Vexeml4bXXfGeoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pt0Igtsq; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pt0Igtsq"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2eacb421554so209839fac.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751133500; x=1751738300; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0BpePDXTFYuI2MwE3S/dZdjl+zq1/CCy3PJT7oXkm34=;
        b=pt0IgtsqvZ52blt1piE3JI7sx+Z0Zqpr3jJGEsbgjRg5IPmd38aSv3DgV4gRoy6POr
         h4HSYA1m9mrBBtI5OX370opI9s+7T265q5a3ky9XNOJmlQX0I5kUFWcNXfcQLhJOD0Rb
         XzWCMHxctAQw3z7ymimUbPl+NiNMIXGAbOB+oaqi53tMBJTSihDK9BkIQdVXAUq+m5MP
         ZyXkK/sN0Db2JoXeHFzLl1091ZLlpPkDh2lyM1F0RFGM8SUWXQRPt7QtuoEaL+7MQnUR
         rC3xbxvQ/1Mi0diZxYIvel6K7sr7uskbrWQSKZasq7AizVSY0x4LtxcM6zk5gq+xBncD
         2/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751133500; x=1751738300;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0BpePDXTFYuI2MwE3S/dZdjl+zq1/CCy3PJT7oXkm34=;
        b=aZW2u0YBIZ+xQUM2VABceZBcqqGa7jxPCauqXImMmwjml+DtHcwejB3UcowKhL/YGW
         qBO3rZDUU9oi2PspryqJbX8j/wwTQ/v/Zzne2RchFh6w4Gy3SUNSYMfNNOuL7HSqm1yh
         o/s9tTOMSLBGH/0BVPm4dPJ4GnpfxbnrNullnMb4lAfnXyQ2wBrASU8Qnu5vnz0vOq4+
         Tx7GXULrCUmA+fgQl1iD3v8vKyUHh6vWjID1vJd8mXtFFHMgraVJMt5ssU+EVO9X3H1H
         NnWtNUkO7G0dGEHe6q3dBC6oxhenHl74GzkgWXC8THIZ9/hJiGpLJAlYVau6OqnZEz12
         liYw==
X-Forwarded-Encrypted: i=1; AJvYcCVjDZVM17FwAkYw1tH6Mp4Qt/5SZgzAvyFMNsKdIPOonzZlbojDF9s934G7EAPDlFjDC6kp/0xvKzkEWag=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRMAKSlTxIRFsbP3kvKfRMhjNQJu3U74eqZmhOgMHAdrsszmWc
	tbHykRX0spPOHxirqNak/uLi/N/CO13nFOgpBxuukeN0avr5y+FdvWYaCbk92MSchTg=
X-Gm-Gg: ASbGncuWwwrKsDxNC0RV/9NBPL+XoitDHbqcIR+1m56XJTizhI7HpzFK9DvZYZKaGTT
	hpXolleABh8My4sW+1TtfgEE38yivukz9MoPX2pZHpENG2W6BZJQuovgug1/4soN3b3J8vqMeNX
	4+8QrBXq0rlw1buaVOniffGwvUzLWWD8k4N1IIvLIGL50faEwW54QKEVNHCkTnQ47UVpBYCvVs8
	kY1Hmtol6iursFHb+tkVzLxUsannDod0w19b9v1eHlVLq/50kePcg+NYrHcxAF5VaqhlwCZf/bR
	Jewx9YS40uKHYPgSOWcBTGQXSZg9U80pM20T3uKGzQLsB5WBXMOwjzAmu657IktF2Pbl
X-Google-Smtp-Source: AGHT+IEDBNH0mmQSpM9A6m7ip9ntoTqSzLwN7bfTq2FR4f0j8VggmHnbjEFl2t0URrnX6fpAITgpIw==
X-Received: by 2002:a05:6870:d10a:b0:2d5:1725:f529 with SMTP id 586e51a60fabf-2efed7125camr5619781fac.27.1751133500188;
        Sat, 28 Jun 2025 10:58:20 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-611b857b8c9sm586379eaf.19.2025.06.28.10.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 10:58:19 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 12:58:11 -0500
Subject: [PATCH] iio: pressure: abp060mg: make abp_config const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-23-v1-1-542cfadce9d0@baylibre.com>
X-B4-Tracking: v=1; b=H4sIADItYGgC/x3MMQqAMAxA0atIZgM1oqhXEYeaRs3SSisiFO9uc
 XzD/xmSRJUEU5Uhyq1Jgy9o6gr4sH4XVFcMZKgzPQ2oGpCDTxc6e1mkFjd2hnsaVx5aKN0ZZdP
 nf87L+364NQBSYwAAAA==
X-Change-ID: 20250628-iio-const-data-23-fcd0c629bc83
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=OQCmMPA908QX9UGJajlcjxE2kt5yILn0ZpbTN56zlcs=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYC00IAmZc0hRqnXqRnQwcgWEbcpcKRwygT6ZG
 HjpZvId8dWJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAtNAAKCRDCzCAB/wGP
 wLrKB/wNu0kthvvikvRKiu4M5dw9ORwReFNw8IBItjHHMFW5Cq0Oa/H/sMLvSI4T0HYCj9ECSpr
 JC6ApcqLFp5Kw8J0Mk8b+bYiGjpIayI6fMQH56TxF2rf59qVz+PcN+oblwVBsVvMweXN1RbwEJj
 ba5/DljfnnaiO/VUgGO1q4FkS/Zary+3mpJd4+jfKk/VlZFIrxr88EnpGCHxHbNqZdpESbD48iI
 lQkRbped6ED3tanW64sFqPdfczsopb0N+BycQHRYPKyRLS0srWB4dH69BRo6OZGsPaosLr6Kk9M
 LNZ2uDIVStBk/0bo6o6aafIwjR7Pg9+t+B0W/sQgFq+BhEVO
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add const qualifier to struct abp_config abp_config[]. This is
read-only data so it can be made const.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/pressure/abp060mg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/pressure/abp060mg.c b/drivers/iio/pressure/abp060mg.c
index a0d956c3e2543f353ff0c157e01312645653573a..699b0fd64985d700fbfe3e6d93fbbe5bbb8ee8cb 100644
--- a/drivers/iio/pressure/abp060mg.c
+++ b/drivers/iio/pressure/abp060mg.c
@@ -35,7 +35,7 @@ struct abp_config {
 	int max;
 };
 
-static struct abp_config abp_config[] = {
+static const struct abp_config abp_config[] = {
 	/* mbar & kPa variants */
 	[ABP006KG] = { .min =       0, .max =     6000 },
 	[ABP010KG] = { .min =       0, .max =    10000 },
@@ -165,7 +165,7 @@ static const struct iio_info abp060mg_info = {
 static void abp060mg_init_device(struct iio_dev *indio_dev, unsigned long id)
 {
 	struct abp_state *state = iio_priv(indio_dev);
-	struct abp_config *cfg = &abp_config[id];
+	const struct abp_config *cfg = &abp_config[id];
 
 	state->scale = cfg->max - cfg->min;
 	state->offset = -ABP060MG_MIN_COUNTS;

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-23-fcd0c629bc83

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

