Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5899B148FED;
	Thu,  6 Feb 2025 16:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858730; cv=none; b=Zubt0pFzliIlLioYUqZE2Mgs7ETekc+oSi+H2r7y2u5cl27z5LCqY1vj8x7YX6zhCw84gkUyD7JoGzJeHKVGopeNB2VbJy3mJtLEPxMRyiXYK5NDGpkHuUIiU59Ca/zWNGlutgDdYPUfw8RUQy2ALKkVE4QQXAAXODgO4fS4x0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858730; c=relaxed/simple;
	bh=CZOzKZXrcgnU89koQaHYHE1IEJn2Sj4bIdQsNIr99ZU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AgQ0yWo9lLc62AlKv87OcNBy5Orzl8ne3eNvFnVT5Lr18VGzTrko+WFkpdyrMM9iCnMYIi9WTWBMnwsr68eL8FjmclFJTzHpyRikCVYSEE1Mks0Fh60XBrmhSltW7urWAqVP5SF1zxKGCOuZXIQtGmILMRzAximVFxej4BiD0B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Inyr9bFG; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Inyr9bFG"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5de38c3d2acso725855a12.1;
        Thu, 06 Feb 2025 08:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738858726; x=1739463526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RZFEkElfC3jrWtTroTKxvrUlu1csTCIfYLKnnRmCrYM=;
        b=Inyr9bFGzD5SB/d4F9EyqPl1q//IUNYi0u1CuxznxytGmOi8jmfpTfBjeuR5blTo1t
         0a7iQahY2YIrzinpevPUaM4CK9GPeP9AdfRKOGIWgaqgWlaRwvWmnENYG4vo4TYBir7y
         cAbtCW/1O+FmdOAeAZmHRlkkL7ZCHUxpZ7dbsdIrvcuqT0DKIDuoByqcHAc9KbRgs+XL
         J/dcJgTE6FeCa0ZyTvRy4ZgvlzlzsUPXqaNJAGpcY8br4INUV7wcOJtuL7oem3UDrJkT
         Bhgaq4YWcDJm8KbnKw4SH1GOlfBcXyS9HduIEYed7mnMLxQOKqMEtK3S6ezt+qnECM32
         ExMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738858726; x=1739463526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZFEkElfC3jrWtTroTKxvrUlu1csTCIfYLKnnRmCrYM=;
        b=T0Qe1j/5TvMe1usheNL1pk7ZfVwghJzEDIh7be56zFzZJEjE5CGYt6olKnvwpagquk
         pDFLtmOm9qXNveLdt+/gqPy76897TKpNCD0P1tENBVijfWxH3rP6YMm1FNbb6ZBkknZ3
         oyMRvzJ0DI163F9VKOxm8heL9gpbUmol2jC6vP3GrKkO+jMdbCPkvGxOmNvvRMipSF0O
         AIAZL11EeVLKyPKkZkcMYt9yV4Ti84Y3zUkU5PjI2Y967VYeEveQ04Bf6AS7FV2x5+M/
         ScuKSR2k5mucBD6XCLsudhsa1TyxbW9SwKsSrwwWNnh8hc/5omouDm5sc0BYcsX5a2it
         AXMg==
X-Forwarded-Encrypted: i=1; AJvYcCXjiU2nYlps46ec9VYuImGdwvQiNkcxeePOPcBvz0LlK7sDN2gJ+FF1w9gQjqVcSO9ufx/X/83T0bxihU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs0KVLHkvdV6mAtVCvUaEMhC52fFFolmy8e7WpYug0B49vG6Oz
	FO6lmdczSrbTguVQ5RfErHLiCb+hZoUdn6WBqNML14H94LywLMwv
X-Gm-Gg: ASbGncs0J+CSbL9Z++o0pfK4dxxj++3sdp+fSaHTG/Bcmiph6hR/FctBkgEJz2jShli
	mnxtNtWq82y++35N/nviA+Xhglt26n0N/rQVJajhgUv6OPcMiBU53VaQ5X+7XranxDymn4in312
	101D4kMJJUrhFKf4g8pzILgGPb2DMKXI57Yba7Gb7YqXIjvgxaXEhVZB7/hwJAULqR9VTbLzA4E
	KtA78CKjgD/atI4j3Zb1PbmpOtIavDfzeV85lxSeC5966rdwBVQkaGUn7GuJz7bP7xkxvi5OPg1
	xO8RAdSevNkkKEbQwhQ+6kgeqGeENQQnVQOiNybE/tCB+jjrfBTigw==
X-Google-Smtp-Source: AGHT+IEhHz+L49TcEKSO0Ph56SfWm0Y55cKN1qcpaAQbuopwzuYAIIw+CvPIHLLmYeSuqIwld1LW3Q==
X-Received: by 2002:a05:6402:2749:b0:5db:68ce:2125 with SMTP id 4fb4d7f45d1cf-5de45018611mr24165a12.14.1738858726236;
        Thu, 06 Feb 2025 08:18:46 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b80fa5sm1094083a12.34.2025.02.06.08.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 08:18:44 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC] ASoC: simple-card-utils: always find dlc using result of graph_get_dai_id()
Date: Thu,  6 Feb 2025 11:18:31 -0500
Message-Id: <20250206161831.2519-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

If the number of ports is 1, the DAI name will be the one corresponding
to dai_drv[0]. If ARRAY_SIZE(dai_drv) > 1, this means users are forced
to specify all ports corresponding to the DAIs. For instance:

	(it is assumed that ARRAY_SIZE(dai_drv) is 2)

	[snippet taken from DTS]
	dai: my_dai@cafecafe {
		/* some more properties go here */

		ports {
			#address-cells = <1>;
			#size-cells = <0>;

			port@0 {
				reg = <0>;
				endpoint {
					/* specify remote here */
				};
			};

			port@1 {
				reg = <1>;
				endpoint {
					/* specify remote here */
				};
			};
		};
	};
	[/snippet taken from DTS]

This is problematic when users don't want to connect all ports. In the
above example, we're forced to specify all ports even if we want to
"connect" only port@1, for instance, to a remote endpoint.

Generally speaking, assuming that ARRAY_SIZE(dai_drv) is N, and we want to
connect a single port: i, we'd need to specify at least two ports in the
DTS so that "of_graph_get_endpoint_count(node) > 1" is evaluated to true
and the ID resulting from "graph_get_dai_id()" is taken into account.

Fix this by always using 1 as the number of arguments passed to
snd_soc_get_dlc(). This way, snd_soc_get_dlc() will use the ID computed
by graph_get_dai_id(), which takes the value of the 'reg' property into
account if specified.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 sound/soc/generic/simple-card-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index dd414634b4ac..a592617e1b0e 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1103,7 +1103,7 @@ int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 	/* Get dai->name */
 	args.np		= node;
 	args.args[0]	= graph_get_dai_id(ep);
-	args.args_count	= (of_graph_get_endpoint_count(node) > 1);
+	args.args_count = 1;
 
 	/*
 	 * FIXME
-- 
2.34.1

