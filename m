Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71250DDD3;
	Mon,  7 Apr 2025 06:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744006419; cv=none; b=oGWIyaExL/CAwiUnieQovxhEpKIVHyg7whZvhKOpWfOKoHN85XKeWqd1ZLIpcLBEju6A9rh4TEKfDQ4xON2ZA9edtIFgqMD+IxB1yyXtfEtnN+fDmvy8jaayj8H7mi/v7kQF8PqhKIGPhCUnPcJqb39LAYba5u2q42xpyJNfCr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744006419; c=relaxed/simple;
	bh=T2v+HZQuJLh/777PXcKKgEGYoNgNb7hmw6Iuw2Sp1Fo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=icWx4Wu7s97H/CShnZYMyIEbYOLvx4DswI3Xe/Gol6+treHrPddlWLDScTGV92w0xlS1t8hM0+q3gEtQPFQE02jZYAM1WJsPQ7cjirgCPHzALocbTlt3Aez/Uop/sxDr2gWG/NYfu1chhHu2UNYZOkJHFl0SMZnaPhROj7uynMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVmHmVxY; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVmHmVxY"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e6df32ad351so3216635276.2;
        Sun, 06 Apr 2025 23:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744006417; x=1744611217; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=miWHpKwFORCOXIiKnOE19+cDOpUJGN0sm5yUlnThvyU=;
        b=JVmHmVxY9n4CDsGXVzftNiLqmm/8tHy8tarw8JISw+EFiXbGeIe0Utjvd63SoOdGYF
         q26rK9pQ0G7h7un4Hu3CGexIc+3UnOcAwa6tzjiD4QE5SzRUsXU+7T9fc92o3ugYdqZV
         ULh48Jo6MzwDadXGHO5bnlmQc3/YOypAqj/GM+XH5RLcTRqI/WNSP+mKXM5acRX7tm/n
         OJ43hH2gP8YuqI3+LgZ8L+UtPvzWacQCH3Kvo3mli/sHFJ7w5pve8UECBEP3fMkzXdtC
         A80nj+boZ+zwSeKO7StXzAeOJfWUe5arpRiiERrxcKgZYAT0cxjfVoock9giI6QbcPOh
         BXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744006417; x=1744611217;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=miWHpKwFORCOXIiKnOE19+cDOpUJGN0sm5yUlnThvyU=;
        b=mybGUJFYv9CphzdMioruQzjkHxfKXDpJN4C+x4UE3cTWutWR0MENHNpJ436JpOxsnC
         Mab682j1ZG/VSWJp9kNXskODMGbSJzhFQKTcDiL96jYlanKmg5RS4fL3jv/JxtO4Zb+q
         4SdWLmIs9aLpTmpduoE3axSPPB8GA602LgrEFe3xm8z7NAcXhQu/zo0WDZByZANE/zwr
         BeUs7avEr2K5cnhM4fiG+1aeqQgnIL1Agc3zXE2zucdtu5Vrzum4P31A/bBI/CMn9vLw
         tQsL/XlRr14snJf68TFlMgi5GEw3r3CTGiI0paNaIl32WuQ/1oOSlPspw6xYTnZzhPYx
         /vHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOAn8paOIaFk6aXPpU7z9KxyD9wuUAWrYFzzWKdRYCHkAoxYNvh4HVtjQ8zTrIkKGCwiH42yWVjyf8/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmpHy2wQgw7eLHrBxQNGTx8/BA8G83OZGmkNMq5bwwegpAKzUL
	r8tW+mYHxNKlZOOYFMrGqCsMsGolDBuBBVzEue/zoH0nAPfwbm/t8C5QgnzlXla3NnODrUvfTXP
	EVloVqtqO7Y8ojZgKMHxEKm1YwJKwZ4OY3qU=
X-Gm-Gg: ASbGncudrkcHVB8KLcN46SZPl4WUdy+2F+dKKOSAZFgagCdQZmlEgU7VpK/8rxfDcT+
	gc/RAgTPpWaAOeYrTjN9nWdZLmtkVkV0k6ubrML3zz70lj/7w2bWoj2rWh7hAVjDbHDP1C+87Ob
	EsarrbtTLK/3N4sEM7GeLIyaqj8lqLE6Bhdg==
X-Google-Smtp-Source: AGHT+IG/dCP0xNX8HtHQdw+PkBt/YAGlxywxj83Bja2T8R+LgXwnvkCQ0ufuwzz+uYOrd+z23g2Xj4bkMQ/63BMzjI0=
X-Received: by 2002:a05:6902:e02:b0:e6d:f47e:6a40 with SMTP id
 3f1490d57ef6-e6e1c2a5e39mr19672401276.6.1744006417128; Sun, 06 Apr 2025
 23:13:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?0JjQs9C+0YDRjA==?= <chernokalsky89@gmail.com>
Date: Mon, 7 Apr 2025 09:13:25 +0300
X-Gm-Features: ATxdqUFCCsfIA-dLYST-SqDr1tsQUMIikpWGD78BA2ee9yAlxBMUDtC6Vy-j0Z0
Message-ID: <CANSeWoEpusQqjOOHLjNKfv9c9boSV9rx9rwwvGNvDnbX=p9gUQ@mail.gmail.com>
Subject: [PATCH] ASoC: amd: acp: Add a missing Huawei Matebook variant
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I guess, somewhere around the time where driver was first implemented,
and the time it updated, some variants were either not discovered yet,
or forgotten, as seen in commit
5513c5d0fb3d509cdd0a11afc18441c57eb7c94c.

Signed-off-by: Igor Chernokalsky <chernokalsky89@gmail.com>

--- sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c       2025-04-06
01:46:50.000000000 +0300
+++ sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c       2025-04-07
07:43:20.891378079 +0300
@@ -371,6 +371,14 @@ static const struct dmi_system_id acp3x_
                },
                .driver_data = (void *)(ES83XX_ENABLE_DMIC),
        },
+        {
+                .matches = {
+                        DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "HUAWEI"),
+                        DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "HVY-WXX9"),
+                        DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "M1030"),
+                },
+                .driver_data = (void *)(ES83XX_ENABLE_DMIC),
+        },
        {
                .matches = {
                        DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "HUAWEI"),
