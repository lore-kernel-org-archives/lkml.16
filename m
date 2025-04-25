Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7821547FF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745547256; cv=none; b=svm5dUJ0woFdY4/c/Wt7qoShedinVAQcjd+soL+EZvLuUBhT4rj6SKiVI+0SyuyqhcG2uVEj+uX/p1QJmCsCuUtwljKU2q8fbaiYAjOJbYLu2t5GOFjz9P4mYq5tC7ywjoD3bLZ9O81xfb18ztiVCyZbvsPJy5QtViiN2nu7/mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745547256; c=relaxed/simple;
	bh=I3A/zHwAYSwnjgk+xe7X/mxwoo6oP41oVPwo+1vnug4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpoDO5gQRK36wFdro79mUJESOvIn4RLpqy71IWOmlBkOz9F44sGFELhTYbAnQJ4RysLM+zFJCBKqTUy3UWHztTQNZ8BH6KTEhLa0WCYkme0AJ2opFKimhtiFjpUzg0Tn9W9Z4tXaaG+rEcAGCKUZdlDEw36DQNf2ktoWQU1nY60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=GKTHmmYg; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="GKTHmmYg"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22da3b26532so16764075ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745547254; x=1746152054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09kVEaqIXaUD+GEpgwr5iE/SxGZwllT1KTlsw5VQ7Mo=;
        b=GKTHmmYg2VRFiafJKBcyjLO6aIcxwnOzkMSmlxg0VqLTiGhOatT+Wf9nvSn0vY7MPp
         hsj3zcECz7pFBP0jyd3H4vTs1jbjdGnehSPOyjgeD4TgPPiQ/LUuWNGJSBU5iQE+qnBH
         0brq5LLbinQBOxGHhE7a0y7wZvRAXjEJYRyXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745547254; x=1746152054;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09kVEaqIXaUD+GEpgwr5iE/SxGZwllT1KTlsw5VQ7Mo=;
        b=gVP0tU3gy8ZGK7CFOsvm22Y4iqH4UlMjwgbZ8dY0nGMYgWVOZsuPxIc9NjvytUCOe8
         9Dj3xlbynVqftVYZ27mVFV5EVNd/fqt4ltLafdO44QE3qAm7qU9t06kJNMbYGHlQ868w
         pPgXS9uv0j/uO3lJdiaL9jrIB2nfzjDOSpisD6CMIt395XHt9sJPJwfoDdw9X0tDpFbs
         z1R2IrzFdlOs/00PaENCE4Ph2a905+cNPZAN2/uGP5ksXIUe8n/5UWI6dRDs0/+DfT/O
         3ZukK/nLBd2dgRcbUpnv7RsE7Yt1jOi+sJyx7nHjCOUfqTWuGZHzv9HexuIP/OHH6Hz0
         1Z8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUx5qnDbHFGj2q+D42SlKAkYnPiBqxRfEN169lpZ5X+IoSpo7XQ7nFSTOapPu1rR6aeKX/CnzbuzFuwkcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWBH9nY917051k6F1t6B2qvW4pelpNW8Tko1IRAp4++468Ym3e
	oCmY2KrtBhN/40PtMnlQ35J6tX0ikaC+8GhTTe7QlxOd1XHqwBIwn7Z8EYk+YFA=
X-Gm-Gg: ASbGncuvHKld0g3HT961pmC9QoRY9/k6mWSBGC7lPm2pI++F0Mk8N5o/SVPZojYDEZR
	rg3H9mMXwk8OaAx7xUL5Le+UFcgH2cNd4ra6YHLnRHLXhdKzJOiCpPYVYHGviiNQf8yBrQHgKbJ
	//E8W/59djEqfymEkzkeSZqGje6B7ll+0RVgBxrBvcRwXvpDVFrIBQj7fEy384sBh88c4X5qRh4
	vH+xpBzWy3tIQOknF1GQIusLJFrDfjCETa3QhVdTWyuJG+kiusFva6W+831P9M4CPzJm+FLkXIR
	Y+AAf5QiNXg28AJVStXEOMl5KA+UsXtY3F7gkg0G711+Inffkx8ghDdqiKn7KUkexyXMIQbCiom
	dgEeXN3M=
X-Google-Smtp-Source: AGHT+IH/PkabTYLPdtMjI7iYWLibevj3DXs51yGrnj7JIYtqi5YhGlW6R52IDmzjr567SoWgTnJEdA==
X-Received: by 2002:a17:903:1b6e:b0:223:3bf6:7e6a with SMTP id d9443c01a7336-22dbf5e8fc9mr10072345ad.12.1745547254181;
        Thu, 24 Apr 2025 19:14:14 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm20934285ad.76.2025.04.24.19.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 19:14:13 -0700 (PDT)
Date: Thu, 24 Apr 2025 19:14:11 -0700
From: Joe Damato <jdamato@fastly.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] net: ip_gre: Fix spelling mistake "demultiplexor"
 -> "demultiplexer"
Message-ID: <aArv84C4NDwv2aCa@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250423113719.173539-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423113719.173539-1-colin.i.king@gmail.com>

On Wed, Apr 23, 2025 at 12:37:19PM +0100, Colin Ian King wrote:
> There is a spelling mistake in a pr_info message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  net/ipv4/gre_demux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Joe Damato <jdamato@fastly.com>
