Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD9B21D3D0
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746122182; cv=none; b=MiePJFYcYP5jFKZwC0o3JPk/tEBj0DHA7keFaX9kvxmMMP6XEd4iQCnLbLb8XI5FSFUUfJF4pX2Z1XlPryxfJKfNJ95ykdQSyhMK7tYA+JMAlevTDDqI5yUSce5XCdkoEmvikSxhanim27pzp9CDMhx8KMefguMJ4Bcl/TcOIuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746122182; c=relaxed/simple;
	bh=N6tX16f+buRl0Q5WlpZYE0RnEKEd2LKdW0ZA523AUno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PYBf0ehPdYDbGONrL0iFGiAml04wQjoxMtjm12lXOcXf/KsJzt64LS664aS0G8RqOEN+b9FUjzCyYln/C4eTmSDOpbpjW4e99SydfgRA3YJX8PPNFp9cCm9jO1iTnituRdAJRMU7PVaWqZyAa6ydqXeYzz8b5GqUk1tkfmL9uIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OS99L9uI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OS99L9uI"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso1563725e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 10:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746122179; x=1746726979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbtahdfp5FHMpcHwxbpsAL05H97qLfPZ8F7JzSmiHfU=;
        b=OS99L9uIMZDSEZTNzvGfQyOyEXzexgykZ20BH0qo4ksM74d6SrEKe4pJAOTlxOc4vO
         yexnrj0+TK7PvB+Pe64yKzoN+t80MW9Kpbxn/xUuH61eX5U+ZifzfDMFAEA43FRmdeOg
         JPAI/UmMgFRYGqcW+WzGHdfNKKBVGYM1PzeWfGzLgqRm66PiOJZb2kQeV9ZuVGbVBEsm
         0i6P1YhWhUvYWz0pPiQkM1kG2w/teG3XI8gEEPYx3Tf0dJT426KwbpeeVtC/681rdEPs
         ORENA8qV32wqFSZzsEsBHZ8ggdLTnqOKOjSC0rwO3ngcSjASnl7fUr9W1At+2mit15mJ
         8FtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746122179; x=1746726979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbtahdfp5FHMpcHwxbpsAL05H97qLfPZ8F7JzSmiHfU=;
        b=j8dB/loJk7zcA7jA18H01biRMJbWelYUZWkpUl8VzCzHLCcMPAOMIk54XR4VN7gp3s
         DhDZIUUNM05LPXDAE4TKlV/bIuw+KfMIh7Tk6feaJq70gzYNBbia/NVdj8yBqaS59vMO
         5AB7XPgJTuh7JXk1yG12To7MHqdIGVqb01pLsY4IKxVEwXgQXyvuWYA1hsl2eMWJ9HXZ
         Qke/F8FPULdJfrtP2tsMFFKbcch0/Bg56hYrkVafmG4rBxdWS89bbTnyJ+nHJshZZyxK
         rPPUmC09cvpvk+M2Q+DOLPvLcNtxdBQCsoPfAELbMlUbliUur6CqJt4qm6IIxkp/f8BY
         sj8w==
X-Forwarded-Encrypted: i=1; AJvYcCV9p96057QIYWNB6kTqRSme1d7B7K75Z8XFeyt3seZj4O6rD2sAQahMU9T+8RbSH/pzXLUz5GlisEbOb5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY9QhIm1sAvT686PlnypeceDOd9cHfNjWHHAkbWJjTBygJMpm9
	yeM8c2KZp6pipZqxC6He4k2CzeDCmgq7AOsbfd7Spl33wI39fL3BQjSiuDEdADY=
X-Gm-Gg: ASbGncsf4Ebq9YMinCxKGt6X2m8S0bbC8EusfD0FB81CRiiLUamr/g3E8EerCbkVUTD
	o2s8hDPvU6gtPdXFp0tB9hU15YtrRO/gYKZ+rozXWzNdUOlXp/Z1sRikBgnhoKdEJeKrDech8tE
	50FcMava03P15FrAvwSsmOu/Axub0je36cPfLN+ql9Rn42VdAuqD8MxudcR2wKU8ZuO3PRhvI4N
	68Le02lFRoFhBWrGwGEj8MJ0wXFA09O3axcL+ZYYQUhCCsjOn211CjihVBRbJA8Gfcbuy7D3RlO
	xvGvUCVR9I5oKQc/hArup74AH0ewAV7VbGJaHav9phu66c8tZQ==
X-Google-Smtp-Source: AGHT+IFbgqGwv6ZjSmgEg3Lx8cvii6iNpRA4DHecJDnG45/G65TYAVuI68vwc/wWg+pIfXEgoey54w==
X-Received: by 2002:a5d:59af:0:b0:391:3110:dff5 with SMTP id ffacd0b85a97d-3a09404c7a7mr965316f8f.5.1746122178836;
        Thu, 01 May 2025 10:56:18 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a88313sm1382939f8f.75.2025.05.01.10.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 10:56:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Rosin <peda@axentia.se>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] mux: mmio: Add missing word in error message
Date: Thu,  1 May 2025 19:56:06 +0200
Message-ID: <174612212102.144653.11927209351988096213.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316135857.1584-2-thorsten.blum@linux.dev>
References: <20250316135857.1584-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=341; i=krzysztof.kozlowski@linaro.org;
 h=from:subject:message-id; bh=PUh2F1ZaevhHgDYTMLXYQavduLaUnqc9S4KktO3JbAw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE7W3zYunvqK0eXczD0snLf8ryY8ZlaxPs101c
 a2si3+qtFCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBO1twAKCRDBN2bmhouD
 1x2XD/9oSSJGhjNemD8xQXrfxwYY60PQwVHl46T7wMqgGgv/ceqQzhLTgAhhILfTz+mPzKNwlU2
 8AYo1i7ozKXxsu1yDTNZPsu0hSJeq7mf6KIP6uKHON8vvNc6s6nR8mR0yUgZR0/8zxgvcmOgQNj
 Cpg01Mbc893p3oB35ViC/uoBkhBjdBHi3USQZQZGabMRc0RXE1CCHL/I6uDKOS3cf8RLVBPKEx5
 2pOc5kwLc92JIpx+Sg5vfLEaGdx6YbyZKEWczZujfLj3vcsk15VRClyKGvSDF18m2gO0r/vDRWP
 QF60Po3QAlhcoPHnP8cwDUW7aoP+jca9IqG8WRg7NDdtbV2Awu65Guvs0B19pxc0p8SG5PexKu5
 vmfjTnKx7C6rfH/RViQqAvnWvFOpQliZbiIQDP3wn/oU2Ia5MncGJ8IMl9ARA4b44kl1d0lfBB/
 MK3F0mMB/zNq/XZMftIiVMwDQ0m/cugt/y3yPgHFo2WsFwo76Vz9a1tbzOKrJ7beQLNWX8OBKtJ
 NPh5ArqpoejugcyBeFS0sEvUpRXf398AsMDIc6mQ0pg8zoKjcQFMTanlXcFAgYbBhKW1rmxyVHO
 m/HLa0hFCcSLCa4Q/PaKcRKCCrBUmbMJdgK/AQeroEZm7/E6aFvcJYza6rMlBWkuKWZVypdcoFv Gdp1uWkv2KEx+7w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Sun, 16 Mar 2025 14:58:58 +0100, Thorsten Blum wrote:
> s/failed allocate/failed to allocate/
> 
> 

Applied, thanks!

[1/1] mux: mmio: Add missing word in error message
      https://git.kernel.org/krzk/linux/c/a87564088226dd78fbc11612c06c6380d81e7008

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
