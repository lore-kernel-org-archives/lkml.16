Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAC41FDE08
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 18:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738780264; cv=none; b=VEgsU3vNziat2snoMnsxpL4MYDbuHzylDrh0pXWnwTNFT8B9+cOQbAZsXI5ynw4j+TDhWMmR7dP90Eyt3aVnLL4rj+Gk/GItK4nMssMlAY+gD1KftydTRn29dXVxKYQU1ay9VmF1n6CeTfGLmx3Wf4zfqMwFA0fE4VZLA3yGeVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738780264; c=relaxed/simple;
	bh=AgAXFdLVVEihfeM8ysZZmEU+gEAxaTs8AYeDW7rK1OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cb2FEPncnTQgCfvqTUKTI5CCKvWk15u+NZBPNjoWhE0Jpz/jRYaYd25Ww1v9LZFTYjiXfHqRH+O3i9mzH8/hjbZK0LEWfPLKoydjRz0iJ32qXxsxIV46pEknw1ajw5IdBuD2RFIar2AZ7M12Utx6jXDSs7yhRaGrn+DvWzjs/Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoO3CRs7; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoO3CRs7"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-467a37a2a53so1494461cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 10:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738780262; x=1739385062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YRu8lJ2S+gftV8NR6vzgjYQmf6hY04ZpBFo14C7wy6U=;
        b=SoO3CRs7z/hVxgTZ6PkaOMevjRIdq7vE3Cu0LUnFVFEtfZLy6hb0Zam7LwROO1TeMj
         6aOMnxTimOX3msJ0Rc2loHLXvfPn7XCt+2MYuUEu/cAxUbGvui2puIOmCKzFWPcOR+el
         194N1Y4J/lRCtU8LOYtN1MO99a1ETvssuMSYcY8v5zOx3cL62pUrpRTLfdY5YaQW78wE
         3BNM3OfPXnOvV9T7sVouEPTGdzUvsSkFm6O4wfZHFy/11Pv13ce4XWbMJH93O0Pm6Y/U
         mAgbEq9X6WRIcf8cfdiAzlEqY5CojWx0XGRGRvXkwsAmjetSwv6k/4EiQte0c2St13wB
         oTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738780262; x=1739385062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YRu8lJ2S+gftV8NR6vzgjYQmf6hY04ZpBFo14C7wy6U=;
        b=tcN+nrXTEXxAQuWqwWMviLdpA8LwRpYaouWsVRZ62l9mQb37e2ZWju2j93tTY1AvkB
         dH50q9Qzezo3FRwttsmzjB5nSyeDtNYUm4sAIWSo2uJlOTVLYY0h4lPyHNJeWRMK3JkB
         GWZOr7fOxGH6ZQ0PwwTI/72gfi/dn5VXdp58qeyKZMUf+NEwxuc69ErGwwoNDMjyj5uQ
         eiZru8M3Qdgm1OEInQokb+/Vl1joLb0EcpSxi14cRoqLAJPitu39bXV3Bl5S3gBXduVM
         SaD7TVjNEDCRQ3z+hmE+037R7Nl90R4yNlNms8d2S2PKRzuWEAJnQ+6ME0ZbX7F5JIzs
         dO9g==
X-Forwarded-Encrypted: i=1; AJvYcCXJwaeLP8+ivry08H95JtEIVL5Lsl+4xBceNh0nrCTgUjVxYMgo+ufaKi0/r/DPWHwC/eIFNWZ+Nu+dLSs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7eryfuRBStoaZhEuDa4hl1mfneQczx9MoYWCCxCfJBj8uHLd2
	m/D8teu41pC4kZpceR07TjdmBsN1D3lzc3ABReqwUdn36p4eA2d+D61mQ8az
X-Gm-Gg: ASbGnctwQD9WKWvW6uqgXY+AIq4hsesvpVrnpQG8YsElyEDObE6EDy+v/Dc25Arjnp+
	CjcBwfeWCp6nIgQOsGQHcZLCjTsJhzpFnNS/1+8sUT+nAnY7F8Nmz91d1I5HRXnqeBc0uFIx6ih
	zRL+Dsl2KKK3hSHd2nO3YZ5oIIsTmWMldLu9CMRzDvMStCSAD2APHP+yrgmKaaErc+YI+VvPWK0
	rWQ/YP58j7n4+JnXwchOFHHQyHv4e1oWp/+BFgVZCd/ziY+HtvL9wkfgDMUgdLRAGnT0EZvMJgU
	7j/LcgowZ4G4gzM536Nn6Q==
X-Google-Smtp-Source: AGHT+IHn5QFciUJNlaHMn2u9bwUYf1eujyg9AiM+KsaTgTPiGuqF2MJbbwWul1/abgvi7UoF9jQH7w==
X-Received: by 2002:a05:622a:5186:b0:467:63fb:68d7 with SMTP id d75a77b69052e-47028303855mr70329291cf.50.1738780261741;
        Wed, 05 Feb 2025 10:31:01 -0800 (PST)
Received: from DESKTOP-GL3U3CJ ([149.88.18.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46ff3bbe998sm57498451cf.24.2025.02.05.10.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 10:31:01 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: Fix coding style
Date: Wed,  5 Feb 2025 10:30:52 -0800
Message-ID: <cover.1738780135.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the coding style issues. Reported by checkpatch

Ian To (2):
  staging: rtl8723bs: fix spacing complaints
  staging: rtl8723bs: break up lines

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 182 ++++++++++++----------
 1 file changed, 103 insertions(+), 79 deletions(-)

-- 
2.45.3

