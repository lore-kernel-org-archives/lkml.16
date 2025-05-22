Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CB429A9E5
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747954274; cv=none; b=szMs3llbKZxD11r4UfzQ/CMjqVYEBh7Z7wP+tuSj3I8WVEB1GZ2DemhCD3PVoLpG/N3hA7FFIbw5NETkZ6In3cyxH3qKW+QTsHdLCYs0dRoeCQV6osl2TxLE/1ppu+h8dl8zGcBRVRmUhj5igrKcZMXqN7MMEZiAXZPtPen7LJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747954274; c=relaxed/simple;
	bh=XJ27/xwWLz/W8KH2VMTPmg1fVqnXe1xQPj7iei/d3S4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwp0TRapwqyHs4fZD/HaKB9E8Xb31bHGzQZLnfOPxscbbGIcGi6VXkxnUYnw2+CPpfwsjpKdZdv5PnBxy/VR4YtQmgiqFCpkclQOMsu3MNvV5fMgNllSqeGJRI2oOf6vZStM02OFMWU37p9hgpYGZ5DYmK9D0ShjWXoJ35IPTZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gE1CE75C; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gE1CE75C"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6062e41916dso4834760eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747954271; x=1748559071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zqOqsD9enrwocZN2XCXrFciGa3ZPBF1bqsvBC9V48ds=;
        b=gE1CE75CcxONMlk5kg5jVtsNefbYKUGLDITmGAX3cRrNlgu7QCbiyGSmE5NQMIpdus
         OPhFOWumImWGyzoahCjUNOc9GKkYOHhCs+Fz0M1wFRx7XQP3xN3pZtHN/Mn8ZZXZ3MQy
         Wb2dMWLehrB+dA7cYKykr+2FA3lDv0IAuaPeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747954271; x=1748559071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqOqsD9enrwocZN2XCXrFciGa3ZPBF1bqsvBC9V48ds=;
        b=xTcSx6fd6P8hh3fyNHaLpjiPbL+7837XQ6Je3Wx0y2Lgfv8C5NrTVQXrnPbsYs/YcN
         m3N9/Fc2MtTYCRKQej0TZCP2IIL0H8BBB76KXlSGa2CpNZpp5i+iLqcGCb/LIt4cpL0h
         G8Hg+po8rVOoBPlq5MZufhAfng/m5fRcEXegoB1NwgxSfe9rkNI2fRGyrR5LC66cyBQ6
         KpjgcXjbUMWNFnN27XPSrdY72WPlPZNFKymv5IM/ZbHaV5zd+Ut/L4MA3dencnZHPHs3
         LCZgLdlsIhobXozx/P2/3Gr5HdkhKBW/DsYV2FxlvBuurAl0lUiGLQYtxx7MkONqV6Jn
         j1rw==
X-Forwarded-Encrypted: i=1; AJvYcCV6aG/9EkKsuEvgRQAPBjNJ5hkxM+qf10Ua6dI8Ez0ompaMwroBI7lcS8l5gY4Jphm5hHShmWdKslcv7f4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1SO2QnMpU8nHPVBK9OOfZH1qZbYLrWCE3TuR7ajeGEsPfHLyT
	+XiJmqfvAsFBoITeJIBe02EofPARKlWCoEKf3Q6+ZGGs+vwhKMdnjFISwSWaw2GPc60qlaBO7tA
	djPM9
X-Gm-Gg: ASbGncsnoGkQ15oJtjMYM7Qr7NwGQwcPv7ninqjqZRJOHBZNb/GBcdkhk5bsPfLw5rz
	0eK6HKsfgq9hyH45Fe/arsIHTZVUVCehLN6iDsRTPfd/+3aL57RTsl4PMxH79XL5JMJHtj38vdO
	7N+BJoZHEeQeEZIycZ7I8dxZMe+eQR5bKVWZEQo5V27jZm5yOXD4ocJEU7GEgyxRtnTI7UPnmQL
	dvlNrkfh/Nsu+wSHxDp1CarxzQrvXULAUF4auQ2yjtT0ZLPnHBj/6O2kkQdEwCboEAqoFmsei5h
	iDgMgVggAhc8pWuH1uzCG28haTz+YF5PaIQF2c8rw0TJzFj3pVnc5Hyma5t+9Q==
X-Google-Smtp-Source: AGHT+IFzOV554lWXzcF1YV5aYeLFpUIO3UBsBYGo8BFzCMTUpdmhgcxpCdf+r6HZsu3QdP1/3Sm1pg==
X-Received: by 2002:a05:6e02:2164:b0:3db:6fb2:4b95 with SMTP id e9e14a558f8ab-3db857a6f7fmr318356595ab.18.1747954260746;
        Thu, 22 May 2025 15:51:00 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3db843f72e0sm36708835ab.35.2025.05.22.15.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 15:51:00 -0700 (PDT)
Message-ID: <4f0d5c19-8358-4e5b-a8f0-3adcee34ffd4@linuxfoundation.org>
Date: Thu, 22 May 2025 16:50:59 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: net: fix spelling and grammar mistakes
To: Praveen Balakrishnan <praveen.balakrishnan@magd.ox.ac.uk>,
 shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250517015912.131187-1-praveen.balakrishnan@magd.ox.ac.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250517015912.131187-1-praveen.balakrishnan@magd.ox.ac.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/25 19:59, Praveen Balakrishnan wrote:
> Fix several spelling and grammatical mistakes in output messages from
> the net selftests to improve readability.
> 
> Only the message strings for the test output have been modified. No
> changes to the functional logic of the tests have been made.
> 
> Signed-off-by: Praveen Balakrishnan <praveen.balakrishnan@magd.ox.ac.uk>

This patch is missing net maintainers. RUn get_maintainers.pl for
complete list recipients for this patch.

thanks,
-- Shuah
