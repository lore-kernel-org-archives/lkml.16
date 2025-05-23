Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAA27E1;
	Fri, 23 May 2025 19:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748029954; cv=none; b=uNteoQVodGyQW/FueqFMA68A7uIJvAKtAN2QAqJzDzCwKXpa8S3fPBlWKhHyeqArKRz/hlNpdSX9k93v7wAciCqCyu/+3okCAJwnnX0UOqjwyMC8fA1AiXApv580DU/crH4ul+ArHT3crXLZFFpAtMK2Xim6i0eIbScrGsiXABQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748029954; c=relaxed/simple;
	bh=DoYl8neMKOeuqXR7Psb9wz68aPAx8dAQ69CSXWwjT6E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jUGebExs9u25GtmYCwOhllu1gQxuwgwdj/YYEdpDqemVs5N0UVA14ZyyPHvKXhzXiF+D9auluc2J96s3V2yzPjij/10HtvcIbgJ+Wm1Qqx2kBL04jchN5F5Vg/2VjlJ4uteu06jgs+2BDpLmplZmr3szazDx3aHbZHT40JRS8Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkqxEfBn; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkqxEfBn"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47690a4ec97so1685421cf.2;
        Fri, 23 May 2025 12:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748029952; x=1748634752; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LZuMU82VeoD6SjXQ3MttsAUR2lLhSZagEoZvudH6MeI=;
        b=HkqxEfBnNGZDEk4TxbCu0w+9cLuSTUeft7+cy5CBnKZLf6aKBhHvKvEW1NduM8RumO
         UHjnIoUDoGfm3Z54He+Pk7FUSDqnb06bfUwyrmbkhQQhx4nq1DWCWHQymnP+k0s5UFBp
         zJ9xEtVaq0t4MR3GVSjs4P1MdAuKneAuNavM34il9lblUtJfXDCCyZ4KAz0yMRQy/Nx+
         0tlXqZhuZKFeAHL4qYzKL6lgU4dKklD4igDh0yZt0XlOW6YaAr337EwFVx+6Vjft4L5n
         aNEF0rhL56kztAN8QPvTUz7HbrzCZuQLJ69rdMVmtx9/gkozHYbZ2KMef5PThlEmlyGe
         n8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748029952; x=1748634752;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZuMU82VeoD6SjXQ3MttsAUR2lLhSZagEoZvudH6MeI=;
        b=hpARzcNsNh8uQTEO5NnywZC2lkNyL7AAj+D+RrRLaxBUhTaOJkUlpXQougMTOFbxsv
         jZhfrpC7PbDRM/AspXi1sMU7rcr75nOK+Ljp5FCdA5hC462G+6Rc86wDxsgbqPo33pJk
         RctobgD0qCTGTWavSsYDD/Tl82L/c7IfEB5uQ1LtLTizaSoCYWe2XEeVBZU/lxcEj5qJ
         4OLvft5IsDRijR36i+yiJj+XclxhE1S3n6Ev5cPnIE7lsBoeSEXLpJe0JRLXWnbzbAvk
         ZAXwcYTVbutSIYzTRkauro1d6z3xFoDOPVC0hwnuvpOUkKcHLsVbLmiOyDtobbSQ/zga
         R8kw==
X-Forwarded-Encrypted: i=1; AJvYcCUS3gNd9A+U6ub5vkUVwvyYCOiejruZA6kU8IZWryXPHff3QQSAO+tRm+EPMFAoES061lJh1tt9kHXP5JCL@vger.kernel.org, AJvYcCVDbNVrS2DcsETenppdZpqyStuIkEAViNYfVD71DuJCyV5ApQnH52lB93ZN7beWLh03KtyZNPPxQ1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZf49C4zaEx+4HcVAnj7LsiYsOgFGLZv7hHV2XuyzpT60ZNEzE
	1oxn/N9/dHOIseDlKcxuekTdfOi0DESVszj5vdxqzWmJpDyEnH1iMfEB
X-Gm-Gg: ASbGncv3C/UPBDZ31OvAfzprw58s8tgW5OMLRVoQo1p+LWV5JMMe3qw4wEnuzKppKqu
	ry4MjwmiK6sVa8iWckRx8XdS0Ho6MzyBSAapxu1nC1mIVnjGOtwg870DTNC4ownQ+IGCD9hTmkl
	fXeRtElYr7yQ+S8X3PqNVgVLFnCC5Kd74T+bpbwqtwmE7mf7e3HF/qWw/vTPKzC1/Kc4a4uTr4j
	CnOG2kqxqrgKzbo0RJwrHTsgOmJFhkyfumagQ6z9eWS7oK/EA+dRjenGEBhcNtS5hi1L7XD8bSe
	PgjvEO1C23uWJQaUk5StrYzq4XwV/90c1qiz2pV46Kgw/AVoO4z1K+eWU2QC9t5gxw==
X-Google-Smtp-Source: AGHT+IGnQY/z93JEf+AGmMMUkG5oJIhr6LzAzc5bOd7Mu9OECAnddCKCevcAKu7ElP4DlshKGt75zg==
X-Received: by 2002:a05:622a:1b94:b0:494:a01d:a912 with SMTP id d75a77b69052e-49f46940cc6mr8469011cf.13.1748029952122;
        Fri, 23 May 2025 12:52:32 -0700 (PDT)
Received: from [10.0.0.88] ([2607:fea8:bad7:5400:a4e6:39bc:5bd6:cf8f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae4fd718sm117133001cf.53.2025.05.23.12.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 12:52:31 -0700 (PDT)
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Subject: [PATCH v2 0/2] drm: add overview diagram for drm stack
Date: Fri, 23 May 2025 15:52:24 -0400
Message-Id: <20250523-drm-doc-updates-v2-0-e517df152cf6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPjRMGgC/3WNQQ6CMBBFr0Jm7Rg6UiSuuIdhgcwUJhFKWiQaw
 t2t7F2+l/z3N4gSVCLcsg2CrBrVTwnolEE3tFMvqJwYKCebWyLkMCL7Dl8zt4tEvJRV6UouKkM
 EaTUHcfo+ivcm8aBx8eFzHKzmZ/+3VoMG2YhjW1yL/MF1P7b6PHd+hGbf9y8DXZydrgAAAA==
X-Change-ID: 20250522-drm-doc-updates-3686f6d48122
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748029951; l=889;
 i=abdulrasaqolawani@gmail.com; s=20250522; h=from:subject:message-id;
 bh=DoYl8neMKOeuqXR7Psb9wz68aPAx8dAQ69CSXWwjT6E=;
 b=WA/dUAMQLPhuxLwgIo8veI2CO3as2EZ8+WPAF94JfZrJoUrO/ZohIijjxG3vKnUIVAMSISNKq
 zNem1mKp16/DieY+exXzEmk6SjqacQLsWM+zx0Ufrao/Hb2Ykj7Mgvi
X-Developer-Key: i=abdulrasaqolawani@gmail.com; a=ed25519;
 pk=LCvBseqd+rEj8B1vNEnSSfNcqQwMsfWx1DGDT1LYddo=

Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
---
Changes in v2:
- Update the overview diagram to display correctly by putting in a literal block.
- Also update the overview section diagram to a higher order.
- Ensured docs are successfully rendering by building for htmldocs and pdfdocs.
- Rendered pages are okay on html and pdf.
- Link to v1: https://lore.kernel.org/r/20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com

---
Abdulrasaq Lawani (2):
      drm: add overview diagram for drm stack
      drm: add overview diagram for drm stack

 Documentation/gpu/introduction.rst | 40 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)
---
base-commit: 4d07f5440d7afee27dada528aaf5230e760531cb
change-id: 20250522-drm-doc-updates-3686f6d48122

Best regards,
-- 
Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>

