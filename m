Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941F47DA6D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303305; cv=none; b=Ip7znyaXpOg54xjpXRYMHxlNOFLf0Bzxhq+/jR0H1rz0MRhXp8HlmAv0l6Bn0wQ6uQcNZSHC98l/idWC0YfmOPhneCvdJ5th7XOClLOhAYvGo7Pa/0DyMS6WO1etOW4RftLMxHX5gYdfO7hFRCvm46c9mCNJSzUbPoRAvf7N8Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303305; c=relaxed/simple;
	bh=L0MQ41gVIL0v7VhE4x6ghYCWQYaXBs50GI0zvkn/IuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjDaHm9xrfBy6cKwXBMZIGbj3qTflSsI0Z2A8KGNz4nigN5Xj+jlza4n1FPQOlOxPN6Gtr7yy4vEzFB9cEiio/UhgWFhgAawUI+ihVzf4Wi0/4EISyzUyVIMWS58nbHlfOXTN670yz/aNJQte3himAguDll8Ix22EGIImSVDB1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cQuQWo45; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cQuQWo45"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so5036443f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 23:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745303302; x=1745908102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CR3emN5pt/2Xy36pQPHQVyv8ABB4y5f35y7rXhRz1Tk=;
        b=cQuQWo45s4jjtywN3SWFLUrMHJL3nTcT+1kdrq2cu4Ue0U8KF8MMmwgsYxmqgsnM1F
         esXJDDdR68W0SS+5D8Lz35+R3tmW2stN3XNv41oGLBUTNs1WKo/UhZWt4K7azHBiQZFT
         PoDTw/lcBxhmDTzL+qQHjX/4tjW1VQyq930qu5BYq5Fyk7gObqvnMfSx4IHFzooVvVb8
         6LgR7wym9QvVGDgI7djP63zBeVgTtNbmvN7r/4TEJCwPL/LFotg/lWa4XzHOvya3m/R3
         HCNW1lIy9jFisJ3X6I0l4hY0GWdboKbgK0HRQ8bY6VO1SIfDCiTWHgHM/Uh+myDjzlwc
         uMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745303302; x=1745908102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CR3emN5pt/2Xy36pQPHQVyv8ABB4y5f35y7rXhRz1Tk=;
        b=Rkk/UXGlXCtnWtNmGOvHy2EbWPkRIrbMHyKjUldKiuRGYLDJW0a/9D1CW0/93V4gvN
         /QawfqnO7nWpuIC0xfJjSk5wf6Hg8BGrbNsGk+gvi8giU7hjAsrES9XnZ6PIuk4zmo+M
         TTb+caAujT/3Q7KUL37qp9qNOIFPGZa62qNB8v4pJp1Ssu6b8MzJqbpBQ1MyvnnfV/wo
         5M5J2QpCEUDh5d/q6JVWQ9dB0vVWxvtrH+YqDYEYcImJyk8se8JdQL6BNWff0qJvP4HI
         7H7ezvWdAiuuv8w20zNjK5wFtN/FscKIcJCs1tdG8dVQPCL5RXNpZbrAu23SAaPhBfbA
         yzgg==
X-Forwarded-Encrypted: i=1; AJvYcCWTDQQqcccNsMj+QlLBTuG73R7OyfgDlG+pRIxvL4vMF3i0wRxD5wqvUaAZPjB1U92nlvzt5nzEIRv80WA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Mi1iDabLUQbKPCdv/7b4W9k8nshGemg3OqGXEF1P8TyHLoVJ
	jfSOsRO5bw4Pg/vF9QFNfIG+P0QM+342Ndje+3Lqi3Ao4O70pUZ5vhXf9jkD8zA=
X-Gm-Gg: ASbGnctx20vdsA0mOflpOHySJ45gnBTKlScWTUJY2RTYBnrFWV8fEZ/hJ7Y7bpH5IeL
	AHSyMKJlRQ2nQy5m8rZ6LY51wCtqWfPOzrDjD76EZ3XvX4IesaeVEaaMPTwOK+Z8uCY53mt/ZGn
	Ja7cUDlk2/tUvmKQJQjI6S+HJjl1J/mBdm25eIxjByRH5F9V0cgQxeP0i9ILCLFikA2tVtVgijw
	FoD90v2MTBw79AY8u0mapOJpWJ7WYjuHyXIzZwaYbLUj8COvut36Dpz4AQLDDjIhkV0LKLJIQfR
	L6xNCKb4B7jzZVA5uPoCGZQQW2FxzRVNFUr5bLV+fv36ZhAl1Ly9Zptx
X-Google-Smtp-Source: AGHT+IG4nAFhnN9/3gxIQTDYPw08Z9MNmw0ZmLCbyBZLc5Z+rprF+I8e39GTZC9U6qsvOzJfbzEh6g==
X-Received: by 2002:a05:6000:18a8:b0:391:1218:d5f7 with SMTP id ffacd0b85a97d-39efbad7d6amr10645232f8f.40.1745303301860;
        Mon, 21 Apr 2025 23:28:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa4207d0sm14265173f8f.11.2025.04.21.23.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 23:28:21 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:28:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, marcello.carla@gmx.com
Subject: Re: [PATCH] staging: gpib: Fix lpvo request_system_control
Message-ID: <60a977f5-5781-48ce-86fb-ea6c4fa767b8@stanley.mountain>
References: <20250419105254.28359-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419105254.28359-1-dpenkler@gmail.com>

On Sat, Apr 19, 2025 at 12:52:54PM +0200, Dave Penkler wrote:
> The board should not set the controller-in-charge status in
> request_system_control. It can only become controller-in-charge
> by issuing an interface_clear.
> 
> Remove the setting of controller-in-charge from request_system_control.
> 

The commit message needs to say what this bug looks like to the user.

regards,
dan carpetner

