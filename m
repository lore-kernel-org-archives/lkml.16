Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7173224B28
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 23:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744761277; cv=none; b=uTZNgtkK7Ne4UVJjMlm1z9YMv27DDXqP6JvdT2VunXtg74p4Y3DyAbOLhL034iSRH+Wdy4L8YeBqM7lcRWxEzZyuZ4WaARVkBcLhHT3WJfqR1/HTNfdvq2ukW4MeQR4EMrIL4HrN9bviyTnmGqk2MfmfxpIUVmXRdQRGTvPxVXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744761277; c=relaxed/simple;
	bh=BL6yJJeDhXCD93iNRfTEC9Bm5Muyaz2aL0uVyTx/0Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCBG28LUWNSy1Nu9TfJMNcDWbtrRqN5mS2UOc09DWKJEVbG54yUhHdsu3VPVzP5qXZCeW91bJ5W6Qysdux/DK7jNlfAeWtVW2NbAz1V7O7cZ2pi9yE0hJm7P2eNonoljzWWGuiL8mojIpmS5gnSsASi9BcNJB2xx2NGLJjQ4Zhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wdz0i6H4; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wdz0i6H4"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22c336fcdaaso1249985ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744761276; x=1745366076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E8HpTrNOtO0f0qUYgBWZe9nM+c1PhefRgZpp2Tj+Gnw=;
        b=Wdz0i6H4YQ9/oNh4SL5t+ra3oBPNqaGT0zKKRNld+gqgFRm/H+TqwsBwQDnbng4w2S
         5/s3yGjYhWhCPtd7AYOpByfFq+CMDDT7bisdIQQboWwjAaUAJRYCdP6fiSx9Gwz8fKHq
         rLx4Fmzi3fFn0m7LuDPM1yzyGPCj5KiHPC0lErIjYw0LIXBZlFVDQ5tSjmRAVyW36bKz
         WHDTxcDl1wQgvG5qbKZ7SheQQ3xTsEEiuaZsY4MatsjBTh5fH9SBwYeK8AXMqjarz3jh
         bnk0X3yKaHKkRocSmJXJF+BkcUZNgYLjGTAInTXqqNgd5CirbtIptDBB+Ai36Dp049W5
         VdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744761276; x=1745366076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8HpTrNOtO0f0qUYgBWZe9nM+c1PhefRgZpp2Tj+Gnw=;
        b=nCYw8+OCRxHqvwf8FvrpcrXYP1IlTRGlWWiK0Lc5KLjK4SQODKl3VmK7bwLjKRr1Pc
         QQtj8x8a0os5srzR/LVOm0Bci9R3D039OeEXsuh5/vi/udKueeYQTkSY5lX9yCUOjxhB
         Q6/h7jsZ5mSJiLFYPDkiMk3BO2oURW38hlq4+jNWUwujPlBm/MVnO1K3P0COY5w3Jyyg
         cPF+1J9qVNqlapJwS/6zKa+PWvCzcWtaO4CPIiTjMuiqqsSzLfjvW3hI23KcE2TLVS5r
         SspBqh4+HYS90vpKarDEIJNVAdUDVdvW7wk6KrdDPbR7umHAt9ciTTmUJ1lNV8mpfNn1
         OFEg==
X-Forwarded-Encrypted: i=1; AJvYcCU0wYL6k5J30Zgd83I6lQt6us9n8iiyPx/BUR+y6uvthMev6tIk1AWWVrpFxwi2agaAta/McAMWAcQw0ds=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUbGtuxK8ZK1Fo5906GpJfANMPcRHG40P2A6B597EBuaANDwpg
	TAPIcyoaGVwtt4USgsiRm+NNX99hlzq+yl36Pg42GBQqB1zHTs/U
X-Gm-Gg: ASbGnctgIH1arcXP9ZabcAe+2UP/Lydc4UJUMEnb2dOD6scyXlA7vyEZa3Ml7nJoBU2
	XvXCkDp1x6t+rEnFACe/vtPApppXhWyK5Vqo3VoYXPztkdg/cxWtCruZB2VlQxEkGSideW9Qycm
	1hGwH5cZInUxxDhSH6U2Qt9WuVlctcnmX1subpLbLtFnneNDAz2Q9OMZkN57IV6v2PDZjtLWPhG
	xxnVSI0Eq8jGbRHPZWTx+3ugB9sfzHBaImJysbOJpbunmtItR/jNs9lPQm0nm9TrLWIJlKfBQrB
	uD80DoZSPjyNeSONO2t3YgGYXnr2g/Lll54IogQRCXFi65cqJjK0zPXJ3Z3PcY+5e7rrBmqY
X-Google-Smtp-Source: AGHT+IHE04hm6CnIpiqr9PbOzqTmilez2ZUFv/ZTrw+STC2K4EXBs1DSf6evz7bomONQiej6L7EtWg==
X-Received: by 2002:a17:902:ea05:b0:223:325c:89de with SMTP id d9443c01a7336-22c3189e69bmr16764165ad.1.1744761275674;
        Tue, 15 Apr 2025 16:54:35 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef0f41sm1270095ad.41.2025.04.15.16.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 16:54:35 -0700 (PDT)
Date: Tue, 15 Apr 2025 16:54:32 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, urezki@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] mm/vmalloc: optimize function vm_unmap_aliases()
Message-ID: <Z_7xuEblD2PXBhRw@fedora>
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-5-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415023952.27850-5-bhe@redhat.com>

On Tue, Apr 15, 2025 at 10:39:51AM +0800, Baoquan He wrote:
> Remove unneeded local variables and replace them with values.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>

Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
