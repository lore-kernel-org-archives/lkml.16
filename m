Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455CF289358
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746631304; cv=none; b=q/LbhUSCBrgE+szflHNFbKebgE6omTfefemJEkWVvJpeH6Mj4RnIqWF1bA7KNoMyFsG1UnR/PBlxQBGOV1N+AK1aP/yrgrcPAbr/1W9swC0LjFNw4QDwicK6/SsqtZpvxVGUhCzpXOpb8e1KDg3nVFHdP50yHS3MmAteQVBH23I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746631304; c=relaxed/simple;
	bh=RuPcJ8+62ptByxwSA6xBoV3f01Qkg9O1ik7rkHELBAs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4g2TgjS3aLLK5gJPGKWVsIoaoZiSUjuD+OTw7XXOo34pgA3Q6EFmu9fva2t1v8gtTj1r1Mmdp7CZ3JeilSWApu1ccy+0Poo9L5Kl3doNslwtLVVb1GL5m7bN0KGSz1A/NNWMbo2fNRdtBP7yDVaIU8xy3rY94E0UfPVfXc20js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiUeXFmf; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiUeXFmf"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54d6f93316dso6064482e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 08:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746631301; x=1747236101; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JcZMQJ48a23nsqfPl8Za/rHO4yb4Vx62XUCuYrapSzE=;
        b=YiUeXFmfxqOUQmt+vKxNHfLj7vbBkfnYS1iZTzirfCptki37t048iH75vvTwi2sJua
         6uQTcEB2kGqsyDbJA/EI4O48q3XZzO88CIKHum3XBbuZJLKBdco6qZmpFIc1T+FrIasp
         CiNC82YdFla4lJxqCM/fSwmHYtQb3Y3JhrGWOnxYBb5/lGsmMbVGuHc7tVfRxyspDc/N
         RinJzDdchBNgpJ+Lkt05lGuI/YpXpXR7y9L261PXU3cRN4hv36LS+fPH7yjE61RD517F
         /xXbhAS53fuNZXuYKS5cQni6us0fEv8zbHwIVAF5SnLlUdT4JTMKpFBWocbt3BF3Ymgr
         1kOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746631301; x=1747236101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JcZMQJ48a23nsqfPl8Za/rHO4yb4Vx62XUCuYrapSzE=;
        b=UpFqTtHOmINaF35VB13CHx8s5wTvnuvSXpCoLMhgP7dIQL6SR2D6wIsZtM+xcKsetT
         aqLF0W7j1oaItGxa7paklVHNDukDMyJAz3Y2Aem8DqE2e5UT4oQiAZABYRxfVsvPDnIW
         Z4YOkOp6N24r3WnVSSV8JRbzeFi9Amh7IzkTZPus2AsCP4vnj45zO6UExn1bffLbknlt
         PgMTv4FRDNqKdo8zXh+qEoEPNhnmvOQxpHFHfh3Gezyalney+f1gUcA+71R2UQZPokjc
         j7l6f7QhoUTnOezXg3Uq2mMXlF6qpLq1XDngtm1aHY7cASCDN5CjtKKy9DpOdyYSb/OF
         1iIg==
X-Forwarded-Encrypted: i=1; AJvYcCWwIyqu3eU4BFMRcSiEFtcxChQRQ+JWSir1EjuQIF7mv+HQ6zPTAe3GsjtR8z534yghVplhG7dewXQjrGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqdbwzbdvoLrRBTdi8BNxcIwqAZjed9kq94FZmZ11Dhpiuk+cD
	2s5b0XxnrulqeIKpxJmfWF+vQO4oV/B7RAGGMaGRF0JcTOIlyVs9
X-Gm-Gg: ASbGncspD0WtNPCiHgz7fEErCLKPOsnccfglxsDD0F58ZnOhU+jBDaAO/AOuxc2U5dc
	3u6kEbK7QR/f5lats29RWFArd9FNZrHASrySg41oXeXDCe6gFOeKft8G1Z/4dtnmmXnCgBBQGww
	2Z5GgoMeDrkLMvOCqFCgxwrG7XWj+ahl55mhFHLvcbjYTUha3f1O9Ebk81hMqt/EYiDkcJzucHK
	Zuk8HH/j7ZnSvQA6RUOp9TZTepyzc5QNey9NBWr79hjdLoo7q8KD8Q8BNsKE3QZTJEmlRLizb8s
	6100V2A3TOZ/TqGMN8nQIBNsGUndEJc1LMULGm0ishnZEf92aIgErxil5TonzW+ADb2M
X-Google-Smtp-Source: AGHT+IFIiwjt+MQcUgajEsNcryZQeg3qsqttcn7ZD4pDU3U+fVtIhwgynkxBDXgoThIF40pJQUonZQ==
X-Received: by 2002:a05:6512:1245:b0:54b:1055:f4c3 with SMTP id 2adb3069b0e04-54fb928b30dmr1406759e87.11.1746631301195;
        Wed, 07 May 2025 08:21:41 -0700 (PDT)
Received: from pc636 (host-95-203-26-253.mobileonline.telia.com. [95.203.26.253])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f2043sm2342432e87.179.2025.05.07.08.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:21:40 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 7 May 2025 17:21:38 +0200
To: David Hildenbrand <david@redhat.com>
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Baoquan He <bhe@redhat.com>, Christoph Hellwig <hch@infradead.org>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as vmalloc co-maintainer
Message-ID: <aBt6giHddIxL5VtW@pc636>
References: <20250507150257.61485-1-urezki@gmail.com>
 <1d9ad008-6bcb-4ded-8e9a-0af0fd68ea2f@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d9ad008-6bcb-4ded-8e9a-0af0fd68ea2f@redhat.com>

On Wed, May 07, 2025 at 05:04:42PM +0200, David Hildenbrand wrote:
> On 07.05.25 17:02, Uladzislau Rezki (Sony) wrote:
> > I have been working on the vmalloc code for several years,
> > contributing to improvements and fixes. Add myself as
> > co-maintainer ("M") alongside Andrew Morton.
> > 
> > Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> > ---
> >   MAINTAINERS | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b2c3be5f61314..0aa8db9d0fb52 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25983,7 +25983,7 @@ F:	tools/testing/vsock/
> >   VMALLOC
> >   M:	Andrew Morton <akpm@linux-foundation.org>
> > -R:	Uladzislau Rezki <urezki@gmail.com>
> > +M:	Uladzislau Rezki <urezki@gmail.com>
> >   L:	linux-mm@kvack.org
> >   S:	Maintained
> >   W:	http://www.linux-mm.org
> 
> Thanks!
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> 
Thank you!

--
Uladzislau Rezki
