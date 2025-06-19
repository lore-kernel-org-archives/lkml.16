Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A4A3D544
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750302069; cv=none; b=FsC0GmRzH5S4SkqoEG7Vt8AJwcc+SoRIKLND/KxFMLcquGkMy5Wr7e/cVXg4ttSXOUOD9tqNziskJKLjUdTBGAfL/jHUXLKrd60ypmLynKY0lp3b2/W9P8/Tc/yr9IiNW6XKyq4rW81gedOw5wXrCVHCRRzEC9lbfOrp2jm8XK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750302069; c=relaxed/simple;
	bh=12gjNwoYH6hAN6AHnzBSZ9IBX5+mwN3Qz0UIR7b4MC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWFuzbO+FGqkGvlFzjsxtREGAhXBT6IhOyiykhIo2heQjNUn0WW92TmVh63vLebJUYFYdRRmYJIwpHjy6tAuPq5xU5wlNffACu9HeAgH/rJuYTfUsk7M6bjB7SL8ZRyTywYEq1SOorGmV6VqO9qZIZulh4jRVtcm9gYEtCzkcBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hvNgNHM1; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hvNgNHM1"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b1fd59851baso229743a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750302067; x=1750906867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cnfPabQqBz/ZwwVEOEty3CuDrAiHGUPnLiwc5VP0zZs=;
        b=hvNgNHM1qxKEnuqXBgRRRQqWMdVSHAmzEw3wWLDNRLXWLGYzOuXYb9lgcXWrwgavc1
         msEFsUvcAdHuK85M2zk+7W8WfZlMJh5psf0vinWkloNoeZvhZljFssspvZ5IM1cmq5+m
         Q0JOwG2Apd9a18rG3wVjUThsaESDpaUiX4TDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750302067; x=1750906867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnfPabQqBz/ZwwVEOEty3CuDrAiHGUPnLiwc5VP0zZs=;
        b=eiNcDFKcpFGQXpAWa1Kdu+45MKPgDx4zI4FYBAcXq1+AGMfhcCwn0zRRKZPjQQXN52
         wAyAPFuiziP2EZSrfRgfWy2G1C5B0bFV4c1MyxBk4lYZ5kcH1vJP/rf+DvcW1ZlYopnx
         coCCs+uWJMbWQGeK0GE6ghoklslFgMMzKUzj82Rx+OhHl4iCL6vr0rnu5MOKXS9B44bh
         50Y+8C9ALnQ+XWKxvzlbKA6kKjC0bax6oKSBm4z7dNTSgEKY8SFL9AYvaDmVq0Ga0KV6
         6ROfizIzUO60WPpP83SFu7SR5Ef1vFPZoxHeFPw/CHlOnyRgBJltjcRWSJb0uEA6onw+
         NKPg==
X-Forwarded-Encrypted: i=1; AJvYcCUjctcDzc8UcKcSyRQ7/wofpX03cQYiqKwr1QV1LGk777+j0S2yoMP42EnZ5vuBZxJpskIyX/OkR4AC7vg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJaCduUkW58iuDbzb7w6+5kGXCbzjUJLBFek02Pvk8H42lt527
	9U/k57sUEfjiZOIJaeaJYIiSriwYiixmSYS5IyaPI0GxHCQbViNb2jVvSJC2uzMqOQ==
X-Gm-Gg: ASbGncuWotCwc02jP8h+ANvAk5Dcs8rcssPQClA6YsfErogP2hTe8oHxEEuAspr1Jan
	VZS/vNrRPHpTNtruCCBXh9UPO6yaqbwnRxfQ0Y8utopOTj6sn5tyMrpd1DieuDruQ558qM+wOI/
	VVVGg45jH54cX6FznTzwY5Tnuv8x2jme9IT9wpfgOtvYRhGnnVxyfIviUVUKQ0pHXa0V/tMxdWJ
	yqpIY2Dk+G9xHnom0ECgl1DAJspICYJoI0RiUEUa/6R+uQcNJIaKzyaQSyymFNSnacYkohER3ZV
	5JLrY0S0wWWdoDIsztMh0Zrcme1sskDr/fuY2j7QTl/XMT3b9Y4+kG3drCHYRTcR0Q==
X-Google-Smtp-Source: AGHT+IEM7nAOf6NgL5UzOu5mBdnBTlvzxMMg9oOfTzsT/78xvmOxaCy1R8U5WMF9AfzgN56JsY7oYQ==
X-Received: by 2002:a17:90b:1c04:b0:312:f2ee:a895 with SMTP id 98e67ed59e1d1-313f1e1a908mr25449839a91.31.1750302067269;
        Wed, 18 Jun 2025 20:01:07 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:7cb6:ce70:9b77:ed3b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a226dedsm1017779a91.5.2025.06.18.20.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 20:01:06 -0700 (PDT)
Date: Thu, 19 Jun 2025 12:01:02 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, 
	Baochen Qiang <quic_bqiang@quicinc.com>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv3] wifi: ath11k: clear initialized flag for deinit-ed
 srng lists
Message-ID: <37vwemsh2v5pweyrw5yxiesz5ktwrp7lfvrej2i4xa3skaxrhr@f7iaggiztmmw>
References: <20250612084551.702803-1-senozhatsky@chromium.org>
 <xgypo7y24oxfe57psg6bdzrmvmahx7swb2ifjxqmpteagsdonw@ubrubygzpbyo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xgypo7y24oxfe57psg6bdzrmvmahx7swb2ifjxqmpteagsdonw@ubrubygzpbyo>

On (25/06/19 11:53), Sergey Senozhatsky wrote:
> 
> If you are        with this, can you please pick it up?
             ^^^ fine
