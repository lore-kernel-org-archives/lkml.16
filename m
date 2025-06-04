Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F692C327E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749039706; cv=none; b=PbbBnhLD/XIY3LrBn/SwexEGS8m91GxI64/jZDDAwafNPVlW4FKABAGour3raB2VtLzEG0x4ffctNgvpYZtf+zWjpArCKWD1DbxIr7G45PKqMYWBvxKNwvq847xxZ54YHikxLjwPiFJ0JfuJL857jO4zdYMy475ys49csOt37is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749039706; c=relaxed/simple;
	bh=R7tzwYh1LXUEAErDEhmuw6K4BeB32f5NFrte3APTo4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHnJkuU+yg4mwFlWuuxRnEJLZHQldZ/9MkZHiNVtazew450Mu5DRA6+eJKJj42eDViktQ7Wf1l/WXLJUByIPPTU+kebN45aT/Qii9kZGcYepypjcGf3gYiFTu2nCQw/+Bu2pA/VvE7q4cV8muO8XQIwcMZdOgrLt1TTz3i3qK50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=BPpbmfvD; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="BPpbmfvD"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a4bb155eb1so50386351cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 05:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1749039703; x=1749644503; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yaZTpWyg0hpKHYyjrUj3+OP2gwR0EFDPrHBmPT8RlVM=;
        b=BPpbmfvDRqIYXmFks/rkltDf7e7IlKQCrpA/4D7qrjDuAE5jVknKw1h0+SPMYMSy3E
         TzHf2ixoLWnpfwZ4pKW20wz+zuG2xntZQ4Xb9ACwx+m/yMnKX6hJTTBg/YPtr5CSW8Xi
         wC1oMX6hX4IwOhQFWu/GHaBygxlzC+hrXyBp+lYE/Z0bBJ3Mv1ahaBQoMddLXHDAR3gr
         idHWmJMIiMDPKBUIxm1ErvTA4ef2+qOvbWRS4ACr92bN/oslG7tZ6rWBVMDtEqwQdsA/
         pLoQrcndEmBEwqJWJamwFSGYQNvtPyD21Op/NHpttnA2x8nT9BQT1hzHpseG2+iB7z9F
         IZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749039703; x=1749644503;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaZTpWyg0hpKHYyjrUj3+OP2gwR0EFDPrHBmPT8RlVM=;
        b=QntQFfw3hR6MF3c3ESRF8BEOaev6AMWoYVoUTgXKqk/SVLbs4HL83l4zo1/5xzuaPC
         QWFrA9mVjNWVYxjvB9vjBtl/HcQ6HmbqxvyIX7CUdjBCeCe3lysszqrLU5moasjXvTXz
         HF+YpPnAuzRoM2TvsQ1vD54n17S90JPCpeTDIBBfL8Em/2C5L1MABIqlpOl4cl8I72FV
         bIvxCxT5xBrbDNGAO0UIwec7zvuuxDjvS4v8U+sThTk3RuKO80T9UzBPDhfxjopZhIIJ
         p6sgAeVvxBI+gWwgR8m9WHuvXRXk4jcHGMWFbCEcJ8174CzLLfuDZpVGF473AJjxZkdd
         anGg==
X-Forwarded-Encrypted: i=1; AJvYcCVijjZhjmmnt+C+VUCtrqHqw7bip0yls0azvhW5rQpjtm4efSm0ZSXjOqDrWFncCU2d36w75IVCWcjT8Dk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq63qH3/4KvADAGRqmacpXqwu5NuWgzYF4dIOP4d78WMGbY316
	6ukKzr9MSdJ7KoJRJd81YrXGwymkXLYwEsANtuA5Y7ExfoDuAFDUM3E1olmLUj1DjS0t8zgnjHx
	UkJAKcraBdmV8mlXpU6LtZO51QRma1KhS+TWTRcmJsw==
X-Gm-Gg: ASbGncveLZ81FQnz5q0TrufvXqrRllO5gBHDW7c8KhoJBOM19/z01ufST44S3UMa7Qy
	xuJhqfNJ1GnvyjjmxzARL3Gsog5CqJgzcp7Itcp60KeyiLixc65dGtdLZ8JT77m4frzWzLf7+gd
	jgfZTmNt5jbThhgGuIUfXSff2b8T4b1Q==
X-Google-Smtp-Source: AGHT+IGBhb9oN9Dnm4FiGYp7zAjk8KUthNG2jfK6LDnEP2PSQ1B7bbxENdlAigbtFAXPzwkkLJkzP6CGB7NZEJFpiUw=
X-Received: by 2002:a05:622a:5806:b0:4a4:2fad:7cdd with SMTP id
 d75a77b69052e-4a5a585f07cmr36560661cf.24.1749039703440; Wed, 04 Jun 2025
 05:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604090054.7070-1-mail@etehtsea.me>
In-Reply-To: <20250604090054.7070-1-mail@etehtsea.me>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 4 Jun 2025 13:21:31 +0100
X-Gm-Features: AX0GCFuX5NY6Hf5wXDs-Pk8QnTYrnxwjGyh7lfIG_jr6I0hdBynp5Y1APmOGjzA
Message-ID: <CAPj87rMU9qcdEmAVuH7E7ENkHCn5zveKA-Sk2bvCB=6BwxR4Ug@mail.gmail.com>
Subject: Re: [PATCH V5 RESEND] drm/rockchip: Reject AFBC for res >2560 on rk3399
To: Konstantin Shabanov <mail@etehtsea.me>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dan Callaghan <djc@djc.id.au>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Jun 2025 at 10:01, Konstantin Shabanov <mail@etehtsea.me> wrote:
> As it isn't supported by rk3399. From the datasheet[1]
> ("1.2.10 Video IN/OUT", "Display Interface", p. 17):
>
>   Support AFBC function co-operation with GPU
>     * support 2560x1600 UI
>
> Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
> Reported-by: Dan Callaghan <djc@djc.id.au>
> Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7968

Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
