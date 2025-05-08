Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B992614A4C7
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707975; cv=none; b=QjOPLrn3BvGDAMJIvrBoRsUkzIgvZ4B3IfH/UUTPS1p85/quI59dPBgZxB5qxnIeiQMXo6urzJKbQULf3Fww4NzrW4OPLU2U/SKMjb+BNO6/G5Zrg8RIx2a9xRMP1YfZEIFw2DmnX363Fqcoui5IHoOCC1E349tVk9ziLZhJlzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707975; c=relaxed/simple;
	bh=5O/qlM7rVWSKfg6Tbnhfh1W3oK06VHBqQTuuHMLx8Yo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sr+1TmzuZmq8GbOXj1iuLGbZGGK2bSi1dFGff9ZviDvd9r0CZWy3OA4Bxy4XLelR1+yTj2a6KgkS+lyUrfsSFDga2T1spxQJ0LIVY9dNyJ6XS/+75p9p5ShwlzXtqnRv8blhzhdjS94xYEamVfGHnhUhJnOMYdLnz+knbK5HpFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/APchx5; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/APchx5"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-548409cd2a8so1168326e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746707972; x=1747312772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YzntpC5Q0DsYCW1J8MImuVh36E6zQaXjyNe15o0Mfps=;
        b=G/APchx57aRvQRwjCWSkktGXkKyhLeTJ/dKZWAO8p4RD7Qwmey8UcR4jo5vsvERcTB
         3Lz46cTHenZrIIyeqShEgEKlCsg2R7MvzxmSZxzMGF3wD4gQC3uOseje+qrf5uey6EdY
         LImNZEKB6YtJpbYJrwi7R8QoH7lixxdvD0tafKUT4O7JUBUnmBQirrYVD5/0xDOOJItq
         JfMExG2ItUz8Wymc9xq9JLCugkL/ReJjrwEeX8omUcqiAjbkrJvSU3hBWgZ19T7xV0mx
         tKEg3xtiuhwvHK2pE0YrSihdGFPnpNkTPkCspEHcIZ+jaWZx7EOVvZolQWBxaMoTzaoF
         EcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746707972; x=1747312772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzntpC5Q0DsYCW1J8MImuVh36E6zQaXjyNe15o0Mfps=;
        b=Pubc0RICXNhK1eDIboLDSVoY4mNU0mN88PvzJvV7zuDUwhHaH44HEJvfXIUB3qXKOF
         R0Y6V2xXtA3PGB7k8jS45GBwuLUsJJZoSWj0YWHPuKGaTvfRM15LMmJJJ1BIOMgr1QzV
         lLSWqTudlg+P8keKW95ugWba6mSJjPfMTQ/tWVEqZe7XHkGY0ds+S4vabv3pziJxTlSN
         UrnObmFvfcSB2/oFwJmg13OfBnj4nF+0JGpqfP/K5yKB2HUIqMTUrboqyVs/VUPvbahw
         lg3SezxFBhhUYoRU+8vMCWg10lxGRpw2QDyuivW302fEz92f62DHvNWzD2FnAgvXs2Jf
         ouuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe67gcYqubFJqjpmxvJWQKiOnEzljD9Xq3zGXImKQVIH8agxqMxTBPYWbp5SGx5mR0WDO6ZhOiz8d+r30=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz++cSLoK5YsTqCTUr0zOj0hbDsGvtjuzU4RJeSZKNjoTtOXozM
	nSbqSU8EeNQCWZatNB7OPjnSzDIgNQ8edGXzqN/Q0uI41dEVU3Gq
X-Gm-Gg: ASbGncvWiHkRP4AND8wYVzxkY0Rs6OlSM+Ha2547qPlnBsNV/0kBu0OHR/Ua5t8j0qp
	VEWlNKyVQxOQFvlSbO/aE3rQw6HeFirEzNqlulzePV72Yf5IYzvAnS9HxhRIz23d1cbxGC5/png
	kWywiHZO+B5nAaNimneUTqCqYitWbsWAAqbGmKBpvCmJFAWo4A6nL/SWnlQwJjxjYz2WhAX6/q+
	qPl4RnlC/8G+iVIF5YmmR+uNhA8CfVMb5c4C1n97OioPvc1ARdZfuRLc9akHsoa2P715FAhda3m
	rFegSqTbGtX+gSERu4y3CO3fNF4w6otO8Xk44hniMV2AE2bZ/haDAeRmX1471bPRIjWv
X-Google-Smtp-Source: AGHT+IHF4yjYJyeGlGId3XUE+iKCzv0spJ5VFdcXRp7P0qdRU9pE+NwAKTwcv8p6CfxsbgBr90JuBg==
X-Received: by 2002:a05:6512:3406:b0:549:8537:79d6 with SMTP id 2adb3069b0e04-54fb9632b87mr3146508e87.48.1746707971530;
        Thu, 08 May 2025 05:39:31 -0700 (PDT)
Received: from pc636 (host-95-203-26-253.mobileonline.telia.com. [95.203.26.253])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94b1762sm2612063e87.51.2025.05.08.05.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 05:39:31 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 8 May 2025 14:39:28 +0200
To: Baoquan He <bhe@redhat.com>
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as vmalloc co-maintainer
Message-ID: <aBymAF0TQ3s-SpPD@pc636>
References: <20250507150257.61485-1-urezki@gmail.com>
 <aBvrPpKNz+EJZG6i@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBvrPpKNz+EJZG6i@MiWiFi-R3L-srv>

On Thu, May 08, 2025 at 07:22:38AM +0800, Baoquan He wrote:
> On 05/07/25 at 05:02pm, Uladzislau Rezki (Sony) wrote:
> > I have been working on the vmalloc code for several years,
> > contributing to improvements and fixes. Add myself as
> > co-maintainer ("M") alongside Andrew Morton.
> > 
> > Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> > ---
> >  MAINTAINERS | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Thanks for great help on reviewing and giving great suggestions when
> I submit patches to vmalloc code.
> 
> Acked-by: Baoquan He <bhe@redhat.com>
> 
Thank you, appreciate it.

--
Uladzislau Rezki
