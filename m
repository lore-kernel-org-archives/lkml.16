Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4FF270ED8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744408188; cv=none; b=L156BbPawwfk94nwUMd6mcapg1ZzFDm7ZJmDZvZ5BhZxBqkZA2IO6l8KKZfJAZgALjnTfdsC6GSidWYnUSpVlgDWTPkTx57//yeOQs3oTEGYMQo2+/iILhgpf/vX9tdO6pG6wfAkDFhKcEu+mYMbLg+3PzKjZV0gMKsCItyq1us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744408188; c=relaxed/simple;
	bh=w8axWvAzoBROAbaKa0HkkEJsDKW2aXtxlAmzSHGwG6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePiZf/pXen+GL5h34OvHLWMvEccJLbiRM6u4u14UjGCN4ETDrvA4BkeLNRrxtL8vVLFloRX4gS+2BwTLYpQGx9Tt9Htag5NCCx60cCIvbZkYkWp2jJOklIrOG2R1cjtfx7/5ZkVbIP2ua8TF8OzcmFCJC4OyU7aM7teJo1hfAj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KPw48yCz; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KPw48yCz"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72a4793d4e2so1446985a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744408186; x=1745012986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYQrJT8juYdQFZjLx91E5kJsRhGDw+hb2VRtHNdByeQ=;
        b=KPw48yCzjt5FABhrn6b5ixkhNLaBDrWkixTC944vauDRdVKUdL8lF41NuJAtZ5hZHv
         wrHoyI0wcl2IRTiTbAwN35WTOy/iB+BKXQrV/EURCj0yfl04a8Wex+Kao3ecXfUD1obv
         ZLt/gqgNfNk+roW0S+6/OUvByO2r/4u+fJKdJzB6ca/r2g9n1z+9xNq3+P9UnUgeKRQ2
         5ulWZdQHvntxD70VufDiQDhBpHj7tNyZoolZEqmund+eeMEkrNXZQ8lcMGKLhG4E7hza
         IYiy8jtojwMmJHQHO20UZ5figgjfHONgcjAWc5Vm06HKNKXgQkHia+CAl+SA1+uRmvAY
         w5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744408186; x=1745012986;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYQrJT8juYdQFZjLx91E5kJsRhGDw+hb2VRtHNdByeQ=;
        b=kD4X68u340O9ZvzyeaB/sF7E1qzcoRJOwNgjvbY0iQh5CflSwscL8C2fqKRDlH60+v
         LO+wikhpSDRULmCEww0OaFrTfUw6Ic1fLprEVax3gowwfzX+aCvHnWw0UAZaylzyw14O
         LPcNf3Uuhkqi8rBjp76OXcbQnNpXsCR9grzxou7cTx8dX+VA/lLwva+x8ccvSbohE5rx
         jZkP4azMsHuAQE22n/ytfeKJ5Ulqh1hOiY3VsofsUp4e2lc9lYQgCwqO+bavoMSUx+Ba
         Cg3NyBP1EWK7bD6LClSNuxSIaqDLkZp2Q4PPyIemWjb9CGp+BvsZXJ0OcAHCp1JUtptw
         V/ig==
X-Forwarded-Encrypted: i=1; AJvYcCWbNEwqFOgqRj3fp0cefCBkiM336AP2eZ0Jw2IcFtAxxmgCifJ0LcttrdOatmY4RgRXCRBsF31a2k6z4O8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzroo8olbU1unrCx2VBTrX5pN7sTlkc1S3STInDDv8D35ZsqWoR
	tORPUpQRBWKn0tEgbvCcsPklcwIgCzyLAve3D50TchlkT1DZhIPl7RPaDBUSUKA=
X-Gm-Gg: ASbGncv/4W6csMBok7pV+gv/HjQZuIQpocY8bsBvp3GehQ7iIHfUgTakgIFJWD0fd2z
	FJfy7lhoaTPSAG3FlXFV3V+LoCAJz5Q6b6YZUZTafa+d/UnB+zo4H0QYzf4BqinNTMqpX6AzAQC
	3S23XPgZzDG89plugC424XCRXeS6wEofS8DuemfEPeNCmkPYORYhOeMay/saDM4O27+e+b/53w5
	MDmJdKa6mCObKgm+mH/270tTgYWzQff8n1NIWNwnCT/753nm8H4RVDn3gyfXQCbUX6Z0xl+90Mn
	Sm+9gt/34+EILu0DVeJvaDELTFeTbJFU0OZvWkxmXFTF8E+YolfAPutk1ZQt3DcbT9Qa5koNpOK
	arrvzGBsN2gMM
X-Google-Smtp-Source: AGHT+IHPOikh3UBhCXlw2AR7oEw93OGdTXiRotETPFiFy2ByOFyfOjXNww65p/TJmOhJE7ujAki41g==
X-Received: by 2002:a05:6830:2aa5:b0:72b:8aec:fbd4 with SMTP id 46e09a7af769-72e862d8597mr3308938a34.3.1744408186078;
        Fri, 11 Apr 2025 14:49:46 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73d8acb4sm1103733a34.29.2025.04.11.14.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 14:49:45 -0700 (PDT)
Message-ID: <341d3eff-aa26-4962-a357-256472622f34@baylibre.com>
Date: Fri, 11 Apr 2025 16:49:44 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/14] dt-bindings: trigger-source: add generic GPIO
 trigger source
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, jonath4nns@gmail.com
References: <cover.1744325346.git.Jonathan.Santos@analog.com>
 <414f5b60b81f87f99b4e18b9a55eb51f29d2225a.1744325346.git.Jonathan.Santos@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <414f5b60b81f87f99b4e18b9a55eb51f29d2225a.1744325346.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/11/25 10:56 AM, Jonathan Santos wrote:
> Inspired by pwn-trigger, create a new binding for using a GPIO

s/pwn/pwm/

> pin as a trigger source.
> 
