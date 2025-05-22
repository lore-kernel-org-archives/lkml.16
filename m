Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D468299A82;
	Thu, 22 May 2025 20:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747944602; cv=none; b=szrKtH9kTw6rASjLwzjQXNnwWSWz5UJdeW4N33VGVnr/8tZ1xIBeEw3O3d4yc9oZ52KXB3OFOxDG+5A7kND6qRsmMC+jzOs0nOFnYs2+VCkKHqidennv6WpU6FBeWAjBSOUd5Ju6dxw5qTeTOgppkbLO/3BmvjieMnjxkSqag3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747944602; c=relaxed/simple;
	bh=p9/pNJYsbJZ0RIuWE1wbo3/DEdO20HrWT0SOvC3HHi8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XQH4XrZ3LGpA5GHLM1cjgtkmFPFnvYlDVU17YnKNehDFLGyZtsajD31Qqrhj7gFisK7srow8ZCFlipaGCBsHZu7mR4lB9IZM33p1vI1+WVyDETMCm6i01dAPmI/AaAcIEWEjI0uFiTC0iuzPP+pLnPEAWX6MR1XCVEZOcfrEl1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vy8TCyyc; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vy8TCyyc"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-401e77e5443so5165900b6e.3;
        Thu, 22 May 2025 13:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747944600; x=1748549400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s0aAykAeokLzVgQoWk8FSpEI5FPVsNBWB79BPE5DV7A=;
        b=Vy8TCyycQVvf0NXaKY1niUMuFLNackbxQjsFx4HrpyQNOVYpjN6yUoxlev6n6xMKyu
         YlFxvV/PMRlBKH5sn9EE3FdEUBa3Zn3mJ0eQUlS4NXGH4ms1PU2n680D1ePEhLeyJZm9
         JhnwUFmFLCh6rvJP4VpuixPLOLcdmYYn/G/WgMcV7a63EGdhN2lawm0HZq6ZKe1SQYIy
         OJTaVGiKKFzDGTUHzsZhUsPIqKk/RraPPCkxlKChl/UdNi5IZHOyx2pn7ySDk28t8F6x
         THVjvXqL9tFkjWajLjO/hBv+SlTylyNmCp31Axrq3d8NoTJ/CvrF6ANcxzGPFMyvOfIQ
         a4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944600; x=1748549400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0aAykAeokLzVgQoWk8FSpEI5FPVsNBWB79BPE5DV7A=;
        b=BsgqL5LJUWYzb9HQfONshGa1GVlb4NVRKbwhj01k+s5Mp8qrnVx8OE+CYc+BddcXWL
         RDj7LhNUpPn1czV80ggZ+Li5PHufgnQWHSoARtho11pLqR239HCyfvUndvx4i15kDwp3
         mkTKAbpa0nUZNzbWbx0kN+BkvxoKJIYHUWZXYvic7XYhKVVPFfYN13v3mGoCUdaXGWyo
         zoN+srEdu0q+1aLkDfA44H7usAt+m1vj4QV0OLyPpGnrW3zptOhUGeIiaSNBiFy0qJ/j
         pWgi85+aID3Z0jTb0rKgI5iAiwM2MwomaiUrEaCqgpgfUY03CbjrkYhNLJC8jbSBSmY5
         ACww==
X-Forwarded-Encrypted: i=1; AJvYcCUnO9qCgjlHElYBaqxkH09oiK0DeR0SYnfB6t6YNgZrHNf7xWYlm5awKsLwKeR1QqV9k+1ns6PFS3JJ+JpGfkasvrYu@vger.kernel.org
X-Gm-Message-State: AOJu0YyMNKL0V6Adct0GYWQKgbAqYQdJC7/MSli12AK/nIJ+wN+8jtO6
	QL4w+qThm80I4RhvbgYXXekgYaM8HaWfQ57/Lje27TlSIJoaf1qKmbdeedKYJA==
X-Gm-Gg: ASbGncvRs93iecjJ4gdpH9LpieXkVHZa/EXmNExSsBjDmeYeR2RUL849B9r7Dd+dIkH
	49+9VguM4amMYroxZwaJ5gr21S83d1Pg96y8k+CLXPzXEroMyktEMe9IH6o3Gp1ykznDjSElvSW
	mdH+MfqvP5TzP+igmeVQaF5ZuNm2e2ji8K7wH8pp1nOtFWCfnAILuf0M9v8nYhnbPUDQAGJKgy0
	JIta4xK7M9Tn9KfjjG760iFXFf90qjnjWGEUJ4fvfbkPdaWM7tTqUvouRBQTCe/bSDGtZCilG3i
	Q4ZD/uw2mh8Ta9w1a5gm+s4PvnmDsPo+2UBu+hSmhCdTQZSQUs0pB6l+mPrSLHmA1yuV/epfVZS
	x4E5/kkK6/r6chq8KsQ==
X-Google-Smtp-Source: AGHT+IHS4UzrtkcgzxaU838V4X3uVzJBnt4QOidUmL5u1csE+c+af+CdRqLtM+XyVXEBMxoI2L4yEw==
X-Received: by 2002:a05:6808:80ab:b0:3fe:b0ad:f935 with SMTP id 5614622812f47-4063d995a57mr459431b6e.4.1747944600224;
        Thu, 22 May 2025 13:10:00 -0700 (PDT)
Received: from localhost.localdomain.adc.delllabs.net ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-404d98b2762sm2651046b6e.32.2025.05.22.13.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:09:59 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v2 0/3] platform/x86: dell_rbu: Packet data fixes
Date: Thu, 22 May 2025 15:09:34 -0500
Message-ID: <20250522200937.9578-1-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make two fixes related to packet data and fix a sparse warning.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>

---

v2:
 -  Add "__must_hold" to create_packet to remove sparse warning.
 -  Make struct packet_data_list static.

Stuart Hayes (3):
  platform/x86: dell_rbu: Fix sparse warning
  platform/x86: dell_rbu: Fix list usage
  platform/x86: dell_rbu: Stop overwriting data buffer

 drivers/platform/x86/dell/dell_rbu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.47.1

