Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637861EB1AB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745307786; cv=none; b=G4UdQy7SqJo3G/++9Hpgq9XdjIdoCmlNJ4GqV9wrhhd7KZA4jg2tdrxrVt24m9i194Km3vJ5ukitEWkXJgLAhLw3xq6XBPQI5B0CItl0URHDZySx/DU2bkkKzaZ9fYn58NldVkAolVP7ohbHcCYKyjHmIXn7W1CEieQ7vtINgbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745307786; c=relaxed/simple;
	bh=O9JdbRWaeCBz+RHOzJxD4pGeS7rOOvKN9vc4OCnEDKw=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:Content-Type; b=ccc342veQ4kUEwWTtLUfpeeSRdYOe7ozn06QXIdvjJnG9uXUZJfPEiZw8lNkBbYUcZaTVXxjWdJowJdxcmeLrEOf/qARZUozsk5x+63T7kO8MMWSPjSq25vKifzXcYriaeW/+dzO+UNJTsXNewtM7gPul8TXmYNg6+jXdXnlNhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=BSqItFQJ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="BSqItFQJ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acb5ec407b1so648985466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1745307782; x=1745912582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:content-language:subject:user-agent
         :mime-version:date:message-id:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvtvMwkTmpPueoBszMdXY/zEz71N9wRSKLK+XNFELU0=;
        b=BSqItFQJaahgrs+pggrd9qENAnwBj7LLeiDUS605X2c9JWiExb/MEQlC8faHbLdvzJ
         qyAROUx66zaTF/ri4S8ffYx9qQPUwWbSnRl+IEbbQ191+bquLYUvC9QA4g8GnLdxw2sP
         i4zREDxEcxhxlh9KoGIlZRNmmFqo8Ok9cY4A0HeSV00NTd4AKCIKIBY0dR+4YtVxDXm7
         EQE16fZ1fZiMd71Uk1kUpm0fi1d4B7NA4GsN9lqv+g5xwkfwaHmtlU74hklxbZU4vIjj
         +mZzE2+eY9iQIE2ajOah7CYz84b2M5uQSQPcuGot2kZ3+pc7Om+T+he5wxXK1zXeYtGu
         9oFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745307782; x=1745912582;
        h=content-transfer-encoding:cc:to:content-language:subject:user-agent
         :mime-version:date:message-id:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvtvMwkTmpPueoBszMdXY/zEz71N9wRSKLK+XNFELU0=;
        b=jU04FPWut+Zgt/3r7hoaC27ndg2DXQAYzmGvZe7DTPykX2s3C9uT9unDzzQl+hwypO
         Mjo4oj5mdSnoyUsbZcQFCxXRv5jWbAYEcJ5gq4jCxCeIty67MX66QZoVmbnLKyBRl+V7
         gUgPuGmSb6yJndykxYb8Znr57gaWfsRoJBbGWRaWYPd/+UZszoML8h4r3N5CRJ5ikU8h
         zMFM8R9IMhYIT9vRPK5JYkJmZBuwjQo4BW59T8z21F3nNftX2d/CLWIsHsjkCR24iFby
         IyzbLKl+gQoEWG7nBiIKdjGzAoiryqCFgj1Dh6sfCpIWRQfdUz1NeyYxVhg5xaJ7e9sH
         UiRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC1Tq7fULe/XXpRp02E7eh/g1zu7iJf7g7Ol4ETOq+9h/PbsxY58tGweF/FSwI0Y5CNG92R1cLRWZZg5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFn4a1pH6Reh7KIyYtxsifFR55WNoheAboMBbOB50mU2iCz1jn
	1iooLjF3DlEdNRbd2c20XIogrHtOrsuFGUq4ydPML2y5SsbkOTwfdDYVL+xdrw==
X-Gm-Gg: ASbGnctTTBPL7QC3CDK5Wrt6EK9Rc7xGODMuJWJjM1N4++gXdJvh6JQw45LnEoJDdbG
	h4mfUe2lam/PHpXQRfgCib56ke+tP16/hGRc/c6umRkRdU18agr1OQFOcqC8uSLTCxnbnDmViTW
	0j7Zr50Aa0UOFAEayQcRUFjfvawmhDIsgS3PXK6fkE3rv6MTOOJYvULT2ZUDDgY1cko7ZWGx8UP
	HJU14qhJRaQmbOjXWavPiP32CXloEKvHvaEYjmbt9IFZAb6R0/b8/fAgK5oXwlBp32rrpJnzJxl
	fIpjcCZCrXYRvB87lZ4kUXsQMErd2kvndYdApJ0=
X-Google-Smtp-Source: AGHT+IGeWOF7rvAQVW49ssEllGvauDTfczcnSBjqrSKrwBLr+txCO9/Ai5Axu/MLfDHRRPf7+rlXcg==
X-Received: by 2002:a17:907:d7cb:b0:ac8:17a1:e42 with SMTP id a640c23a62f3a-acb74b1ddbamr1344361966b.22.1745307782452;
        Tue, 22 Apr 2025 00:43:02 -0700 (PDT)
Received: from [10.2.1.132] ([194.53.194.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec4235asm615437066b.39.2025.04.22.00.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 00:43:02 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <5555d3bd-44f6-45c1-9413-c29fe28e79eb@jacekk.info>
Date: Tue, 22 Apr 2025 09:43:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] e1000e: disregard NVM checksum on tgp when valid checksum
 mask is not set
Content-Language: en-US
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Some Dell Tiger Lake systems have incorrect NVM checksum. These also
have a bitmask that indicates correct checksum set to "invalid".

Because it is impossible to determine whether the NVM write would finish
correctly or hang (see https://bugzilla.kernel.org/show_bug.cgi?id=213667)
it makes sense to skip the validation completely under these conditions.

Signed-off-by: Jacek Kowalski <Jacek@jacekk.info>
Fixes: 4051f68318ca9 ("e1000e: Do not take care about recovery NVM checksum")
Cc: stable@vger.kernel.org
---
  drivers/net/ethernet/intel/e1000e/ich8lan.c | 2 ++
  1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/intel/e1000e/ich8lan.c b/drivers/net/ethernet/intel/e1000e/ich8lan.c
index 364378133526..df4e7d781cb1 100644
--- a/drivers/net/ethernet/intel/e1000e/ich8lan.c
+++ b/drivers/net/ethernet/intel/e1000e/ich8lan.c
@@ -4274,6 +4274,8 @@ static s32 e1000_validate_nvm_checksum_ich8lan(struct e1000_hw *hw)
  			ret_val = e1000e_update_nvm_checksum(hw);
  			if (ret_val)
  				return ret_val;
+		} else if (hw->mac.type == e1000_pch_tgp) {
+			return 0;
  		}
  	}
  
-- 
2.39.5
