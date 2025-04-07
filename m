Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E32253B56;
	Mon,  7 Apr 2025 19:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744055990; cv=none; b=R+0kbEq7GCiYdJC1IWPnQv+ns72WXWCWNclbAoYG7jDJCTH5zmK7GxjkuE3yuUZVRPnQrcX2a4E54NCTQubAIB2FAkUCSWAChMmUWYTvG2BXhAv3R4d+b8o0gW8YnA005UX/WO3V7+QLE6Nja3KTQCVVOrDWQki9GdQggxqOFgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744055990; c=relaxed/simple;
	bh=fG/JotKUwrRStewHDslmD7KAYdZmrjaakxc3PwvYuig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hSES2ke1LnHJj/dQ7dd424vmgW9tztJthjFMts88Vr4Alo1GJ0gcWUn3G555gSHZS2Z00sW99geAimilKND2/lj2fEiRk6pwwq3Zu5N8N8dbmIpbVTQulOQPyoDlgl+gLWiBad5g5TVNNXC0KlEthrV9RM3+G4QbivsBUI2hi2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIVEKfCP; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIVEKfCP"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-72c1419f73eso3008149a34.1;
        Mon, 07 Apr 2025 12:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744055988; x=1744660788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5HVrCjT0rbXRAZpGIjJMIUCrhaf+V5aTTeFWXjljB4=;
        b=cIVEKfCPUIDtQFEMQPyr/dQObuovZCfOLow9KJ2fvqoP/55AtUe54jAmb0T2gkoY4x
         F/uP7uiOQ6mvEBQPWWccTOhSF5TcLjiMjMLfpMefdGq0trmpz1E9h1z05AI50ujwkCAb
         Tbn2W+OhWJdFkmpwZUEnixqjf8wprhL0pv1GxxgUtW7ak2yAXv0eyvJ6Vs11zLWz/rXa
         q//0z2egYLkJQRkOm/CcXWS6I1Uz8w+ZxGRIcNRJzklja0w1D1edplV0o2K6g1iBcCNt
         0ZRgKZ1bvux7c2iC0eQ6p7b13N0cp0pRCsuCfgF2PCxivjuSfayRF1KXGG6xpR/lgzmf
         3sVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744055988; x=1744660788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5HVrCjT0rbXRAZpGIjJMIUCrhaf+V5aTTeFWXjljB4=;
        b=GRVFqSm6z6C4PqW+u5zB7u2PvzxtYTynR/jbD1gMLasE6CahBFrRLzvET8gfYFS8xm
         PWR6zwrL44xXK4UA91r+wRbfN7PySJZk8KFOKAeJFQ9v5VxWEIOcG5OPzAnScjN3fLK/
         kLHp1zzukNHt17pp8orgPmT52keEzoB4Tl3lYL9806Qgw2tzsGOukC+ce1YdAs3SaRKG
         BorIFAVMhvEiWqgGtAllmd7Hx1HBsWkrXNPOd4Bsb35cYFf1U/LOMkYKAsQwSfaFlXgL
         egjwlIMgr5WB/+OHjaB8LOOTFBn8qW9rxj4jYZQsp6q5ctCXGE0AuORbC/oAwctoNjDd
         ge2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+q81aht+B0ed7ARSl0Z5hpO8+2WyZIiIgUMG2ON51f1IdN5/6IpW+H4qTMh/QMyVrj6yrzYyPtsGc8V8=@vger.kernel.org, AJvYcCW0M0O253GEtTb9BTgF5ib8BmnJZL22MlqKSFsdWC2mkvRuH8r/IE+mM4rN+53ym1fV6UvjHbh8kylRGzK6D1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzibbRsGadPrIT6rg/SeWoSaZQeTaLfEWmb9E/zH0kFvAlO6Bvx
	+ultrf/+yXmbpjcCHE88FVb7XtLXNOSIMVe/0xAV8NF7IFu8XWHM
X-Gm-Gg: ASbGncszqTYtufwaMG/rC4IRtlt7ALA52KcpHL+5FJwvByeIUn+QSNPsrYrbzLKUcRh
	p5YTzOD4tDjvREwJXygo19Gu1OtNcvd5xGBDl0obmYgPeVj1P+zdVt3W/fwPl7DxCdth58207wI
	sfRpwHndFQOlzFxJzOafWfFnIA/oW0ZBCWBoIaHpMIEcI/XyF4dT00mqzBdyiPMn5W9LuRG0tAY
	7wYSUpRx4X9dYUIBurdTqy/4f4kAnQhsKp8iJEbevU8KdYh+TK4Rt7mbQu15qs/qJ6Fh5pl7oL8
	vuZShWl6iQWzhkC3GLSDqtYh8x+GqVzr4l6fwYDzxPIqmN8R3hXZwoXkyYnJdYG+vUVL51KqM06
	Z8bjm5VyrKe0YSLTI
X-Google-Smtp-Source: AGHT+IES4Ldx5nS67QIlJrHGyF55/l5wh0DjOa58vveqXFlQYR5XXUkpxN7lfM18rO0Cj0ndNlFqXQ==
X-Received: by 2002:a9d:5f18:0:b0:72a:97c2:3f91 with SMTP id 46e09a7af769-72e64a72099mr461993a34.6.1744055987736;
        Mon, 07 Apr 2025 12:59:47 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net. [73.76.29.249])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-72e6527249esm68060a34.68.2025.04.07.12.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:59:47 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: tamird@gmail.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	andrewjballance@gmail.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v3 3/4] rust: alloc: refactor `Vec::truncate` using `dec_len`
Date: Mon,  7 Apr 2025 14:58:21 -0500
Message-ID: <20250407195821.1670860-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407-vec-set-len-v3-3-c5da0d03216e@gmail.com>
References: <20250407-vec-set-len-v3-3-c5da0d03216e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Apr 07, 2025 at 10:52:33AM -0400, Tamir Duberstein wrote:
> Use `checked_sub` to satisfy the safety requirements of `dec_len` and
> replace nearly the whole body of `truncate` with a call to `dec_len`.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

This looks cleaner than  my version.

Reviewed-by: Andrew Ballance <andrewjballance@gmail.com>

