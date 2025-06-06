Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4628082866;
	Fri,  6 Jun 2025 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749225703; cv=none; b=sw5QkmZfrww3JdmN9rj5wus6FxZIOfHtu/3g06awg8r+6xT5W+8vCVxt5SFH/n45ho2IKRESuzVOAR5Xu4C0XMTyIGSgsgPH8H5JftRbMui8UlKqLNuoi7mZ7WAYLS4fQ68knu/euIyczYnIHhW8iFq9K42802lPjkqvGD0Nmwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749225703; c=relaxed/simple;
	bh=nm25pcAcVJI0cheKsvQKjVyk6CHa+YZoF+h1z7RNn5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttn2amiJECnhcBABZAhUwbiGRW2H0McvU+4x6uXDCaxnlZ4R5lw26/Ozl+6ipnD4K5LzqhqT5c+K+PoninmWBIvozRuw3jiB1zt6Z8W5UPw5U4SbJp0/ju6kzwx5kSuX6lPHCKRif+DcnNjt5rSnP4eW59wGQXw0awBAgyKhkf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfkkAK4D; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfkkAK4D"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a51481a598so1382263f8f.3;
        Fri, 06 Jun 2025 09:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749225700; x=1749830500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUbXR0bwQGiCRtW9GFJ1y1yZl1gXhHCz0DArJw0qNw0=;
        b=PfkkAK4DI3HQluxkSzfniXwNaIw6cbP93T56+KRPGNca5sryICWEUY8w59lDMXcHGv
         2nnxLxXGSAWAd4nlYWDthYM3afubzbziPzi1AvCgYYJCY3scYZUgOj8Nv+v1hJJytyu8
         IZ2WBge1Hx2eTFq/myY/QDyk3uUEyWyWZpA6wMM+uf+WSCaVtxK8vsTEqs8x0IgQq4mA
         JnSNR6UULOBUsTcf6lwSa1q85oLorgTZZsioAu9mxUY27moawr6fP+txXvN7cPvMSkJT
         tLdjnYJDMJA2d8jlZrhw3IA9zPJcIeV11ujJV0/knzoitKwOC4z9FiWtoRHsJ6GRGVOj
         FfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749225700; x=1749830500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUbXR0bwQGiCRtW9GFJ1y1yZl1gXhHCz0DArJw0qNw0=;
        b=mWvN0stnwmnWF9oLoMeXfTjun1InNJj1eOA4j/+Y3k6dSkrjttuwpgw+OzX3/1++Ge
         N3TvQzBXfPyiy7w0X/qowwD7MGWe+kmxVxrHJvl0lts0PRpU99TZ8PV4W9KujMOy8+bL
         X3GW97xvw8azTMRJko+gX4fiLiBmkN3Cr07JOOWQgEG/sI7dBZVWw0VDflZr9UtYqjf+
         FXWz1cmk7giXVgO9jKD5AuA+HugpEePKxokepCBK/pIgdRae0HSpHzwP9DBNGbiZWH2Q
         5Tn1aMdijO+lsb7C9GwGQvxKH5IhNpwzpYS0l3SvBYFF5yZw/WAmVsNqyK4t65d/arVY
         BMjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjAkTXCuXh3vvqvP2V3GFQfSPwGbo3QzMJp2vJUYM5GU3pKF3P+a47dG5OTmsvPh5sb0qOJz6TOmiO@vger.kernel.org, AJvYcCXqwTFzvsKVd3WRCugIX5in/kzvthnv+kaGp/2aStisJzmdHEfKd1xRBq2wAXOgy+8XKWlsmzBeukQ4hiIE@vger.kernel.org
X-Gm-Message-State: AOJu0YzHJr1etv0SVdCseETSc5RIEa88KZIW5vRifENzfcYlH77SqT80
	coj8P2gh6qwr5lEcshqHrdKU6envWCFk7JPXpKXENAVFLPMwwAzWKXUd
X-Gm-Gg: ASbGnct+ROyqT+KZOFRd6na8v+kFRA5xUPi1/POIpeYEO5YVntut8447+9+YdmdnmMQ
	T1bt604DHnJ310izjBoacrj4knC6gW8gNLghW1A6tSK84fWrNmmqsMfLuxanaD0Amf7206nrdpH
	BN4Mx1UrtxtdbSJShLMyCYv8yIIwCSx/N4IcYxePSWP4wjE7f4nPvAHeN2H67gfBO0YubFidnEk
	ZRjjpv4+Jb1ZhA89aa/7PU+IUbpIVZGM1J5gjkXYbs9XGH6XfWQXgvBocTT2Ix5pAELESARPXXx
	Xr5eHTi5GZgayKbt9hST1FHYIOWFeHbEwihqsnYlTXFRNNv10dJrtSXo3A+FbqW5TXiKcylqViB
	Tf6yxfmungiD8ckzxCLl628cb
X-Google-Smtp-Source: AGHT+IEmqmuKj6FXn9i/uI9zQy+znVxChGqy5qwFVVuIhtY5rcMLHOtTf0zBBGAfuZkiaQUGnO+8Zg==
X-Received: by 2002:a5d:4fd1:0:b0:3a5:3930:f57 with SMTP id ffacd0b85a97d-3a539300f8fmr652283f8f.51.1749225700083;
        Fri, 06 Jun 2025 09:01:40 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-113-198.web.vodafone.de. [109.43.113.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209bc6c6csm29070975e9.2.2025.06.06.09.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:01:39 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: krzk@kernel.org
Cc: abd.masalkhi@gmail.com,
	arnd@arndb.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: eeprom: Add ST M24LR support
Date: Fri,  6 Jun 2025 15:06:41 +0000
Message-ID: <20250606150641.3140295-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8ac3c2da-2824-44fe-942c-fceb8b6f5332@kernel.org>
References: <8ac3c2da-2824-44fe-942c-fceb8b6f5332@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

thank you for the feedback.

> How did you implement this feedback:
>
> "That's not a misc device, but eeprom. Place it in appropriate directory."
> ?
>
> There is no such device as a misc device.

I will move it to the eeprom dirctory 

>> +  reg:
>> +    description:
>> +      Two I2C address, the primary for control registers, the secondary
>> +      for EEPROM access.
>> +    minItems: 2
>> +    maxItems: 2
>
> Replace this all with items and description:
> items:
>   - description: foo
>   - description: bar

I will do that.


>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      eeprom@57 {
>> +        compatible = "st,m24lr04e-r";
>> +        reg = <0x57>, /* primary-device */
>> +              <0x53>; /* secondary-device */
>
> Where is the rest of at24 properties? Not relevant? Not correct? I had
> impression this is fully at24 compatible.

The driver does not currently accept at24-style configuration properties
(e.g., pagesize, address-width) because the EEPROM access is handled
internally using fixed parameters per device variant. Let me know if
adding support for these via DT is preferred, I'm happy to extend it
for flexibility.

Best regards,
Abd-Alrhman Masalkhi
