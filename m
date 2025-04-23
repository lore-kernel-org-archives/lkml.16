Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEDF26AD0;
	Wed, 23 Apr 2025 14:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745417842; cv=none; b=g9qjZms/RAGb16MUgQApgZfVvIJm+YidckogXIrKiNmrML0QT7YupvuV7uncJbZcapRukJ6Up2qVlx7RtyeEjK3JNnjt3Kxqblwi6tUjEUs/s+nM23pc7tlGYYr5KksQZ0xctgUF36qSfGnon3fAI1H9cSzXWc4/6CeWa0blSIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745417842; c=relaxed/simple;
	bh=5HJt/rRhtdq8+W+OwEdacaXoOFWR/OEQdd24T8Ms78c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7FWAKIMtYdiLMBfN8joHA0XU4qOaT87k7HYIQZ1INj9U9tBAMvXwKGOCRyOQi1sytozYwGqw1Ts1I5rXiyQqEi2ykgYbwst2tXCk0Smv81nM/TNL0QEwoq+sm2bfCnCAO6L27ukPyFR88j4SR5ggLk2LTdkDXB/nbNlhsyHdls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vyb38WHu; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vyb38WHu"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736c277331eso1030349b3a.1;
        Wed, 23 Apr 2025 07:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745417840; x=1746022640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGvmKBMLY4p3w+HX3ouLWfHlEAljmwmZ7WMUcXOKXoY=;
        b=Vyb38WHuuIbGRIzXB43AkGFz4E2xN29jCUDJc0Br+bFCPNoQaTg1em5I6MbbGRKcAn
         eUgab/3ItNeh22MG458+FkLr/Kxm/CBHxhZiqH6Ct8hXATy5f4A4UNig9N47XRkTjDUD
         tNCctF9mtKspmyKTDTYIKXvCZTH+6ATrlZNm5V/LRAv9qDgiGy/BErhDHWZ5FLAcE2im
         EMprI2PnyHJBC69XxwSWPq4NT/sReuypJUbdKiIzRIVEw7PUU/pVWDVb6yYJetVW0iyn
         2BlWSzUopGyR3/teMawdB/9YCGfzRHnn71kVkuOMRml49ZkLhb3WF0cLBmGXoUCyeFkr
         aAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745417840; x=1746022640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGvmKBMLY4p3w+HX3ouLWfHlEAljmwmZ7WMUcXOKXoY=;
        b=SRpcii9oC0AmuKJYDuOCyhXptvnFs+dGbvoibgh6ev9AZrwxYAr0ZsdMqAGVm+CN6Y
         DVscRE9ThIOzAYkf6rjfx7d7eCjzdLLQO23iPxU4fKN1UHzKMgRIp5OqIVLJ+QiRlQow
         /bhjnMYysnJxWkEx6qPY/zW6WZ5HdiPVBsK+C2dQFKpygymYcDqoM2XjfAXbxEqD3WSg
         N3YFd8skUBSqoy0VncuEt5zZKPVTtirJJjQvE6QXkUksuCg8CYK+mdWy3FrXUv96eE5z
         8FRJWNKC2x1rGMefq4Rh79eOeA0SP575m87EYv+foVdKhtkpc2hCAPISXY0JG9c5ZDH6
         Hd+g==
X-Forwarded-Encrypted: i=1; AJvYcCVXunTQ3wVOGTc1sJ2/egqoQ8iT+poTZmpEFIK62RCNX1OfR1YCNj4XTvOBkv+OkVCBF3nw0A2gZ/ft@vger.kernel.org, AJvYcCWA/d56rLI1WkSgE20ZmakvpmCzkCN5XOjVQaXRyB0mYZKW5/OKkYN6DhHHnj69RzsqwL0uAjN0HWKaGQc=@vger.kernel.org, AJvYcCWqaZXb0acDFxFN4wr6Bqybn8yDmTOXneC2Rt1mSNaV4Ox5lfF1sGXYdApitdpg1mEbc7VtuikMZmTSFima@vger.kernel.org
X-Gm-Message-State: AOJu0YwqT8dLZLXuio0iCtFw+vuTIhSYdTc2LidIM5UQLJ6grhz49MGY
	+ts0bFKvcNN4fXuX0e6WTki10GK2fSnTnW01em2fIt/k4Z9Bv7RTBWN+RA==
X-Gm-Gg: ASbGncvnEIwde1lrkgiXdSlKVkYaTqJnNnmUYGsouPSy8Dgu+lLkLu8krYX4CauFmM8
	6KDN+XtZNCOIJmBC9mNahHJwKzcJs73UGyloe/1phaxVgtqGnUK+xbOCAzsFSqa/LNEMOPEaOtz
	MOcQQYQCr1P/OhqZmz5ikTWtbfSLfjhdnAicFPREZX71/yfPwYMGRBtWjTIKvNkiXIv6elktfbf
	yo5kmlF8GSe8nbejcBw5BW6cXxO+PZrltkBwdVY2w10+QSd5R0cDEx8745msw45aaBndn6SBNZX
	dr+V/ZvzJ2EdHS4TsRTliwtrdsCmNuWymxBUlFDEn3vJmbVS+VlThw==
X-Google-Smtp-Source: AGHT+IE1Lc+m9nMGn9/Spc959uRCM+NgGxyBWwlVYUutqCGWi0088PBRM3kSWuCeGWFHEYAPTHE/tQ==
X-Received: by 2002:a05:6a00:a88b:b0:730:9637:b2ff with SMTP id d2e1a72fcca58-73e135c5945mr4322632b3a.7.1745417839709;
        Wed, 23 Apr 2025 07:17:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfae9885sm10622743b3a.158.2025.04.23.07.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 07:17:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 23 Apr 2025 07:17:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ti,tmp102: document optional V+
 supply property
Message-ID: <dda0b47b-4141-4836-832b-035851045ae3@roeck-us.net>
References: <20250417180426.3872314-1-peter@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417180426.3872314-1-peter@korsgaard.com>

On Thu, Apr 17, 2025 at 08:04:25PM +0200, Peter Korsgaard wrote:
> TMP102 is powered by its V+ supply, document it. The property is called
> "vcc-supply" since the plus sign (+) is not a valid property character.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
