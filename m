Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7381C174A;
	Fri, 31 Jan 2025 13:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738328548; cv=none; b=dA3gP26BkPXUlv2zAVBSlCjGAdQ3fcTimF67MZfpvty7A09FigsVEkbnzYg3rWOPcDwcCShq974GO/Ep3uK4LAljq6iaKblNbGuPYjq47NiOLoUcUB8d2oHJwblD1sjNH9A7uQBK8bW3BsBwb+/a9UBvCRechVqZDaTQ4D7jkcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738328548; c=relaxed/simple;
	bh=ha3GA1YeJrWZZXOHK2YRUHj1Zw4fHBWjpmXy5ZEJcNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HA34l3IMxNjAlG7yta9CNcOSKluZOP0spJJYdqM1uPx8i+FS1ZBxVyEeBcLHwOMDi7I/RJamIPPI3y5sHj+0dLfL06y9ErR5IxCBhuk39tUPlVX/AZsieqygKzUySTqlVtVix/4D8BNkHyW90vDNHZpHHaspXg4L35VLAjodQfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Y4KKhUGL; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Y4KKhUGL"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B82E14426E;
	Fri, 31 Jan 2025 13:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738328538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+kwLBBAKHwJScVqX5D1od3kUCloHeVAnZHLlm04sT2g=;
	b=Y4KKhUGLCwXU0ABQLBZThvOq6BCwbcDbX4a0O/V4To90dJCzQgQ9SaGSSeEGjx39cyM9xu
	PWRi/uehJD9C7NzKqBMLblppKa1Dvge82TN4RUHzQcLeHkWChKHM/DSvrQ8ey8tuw0jK6j
	fuXXgqtE73uIsQRK8gSWkjyPJcAQUtgGjoEjfWNthklzS3mxp5B5ADzEB/Lmhi43hARbnE
	Jk/vsYSl+h2khKTWeJLOPxkC29Kuqz/AwdsZdX+D2hDKue1r25W4BX8quLyLoB1MPUYPqx
	hpHR4iQEtmuiHJ1h9scyWtXKFhXie2uDqMzu+fjir1LLIBV2CZ/C76/QTEMgZA==
Date: Fri, 31 Jan 2025 14:02:14 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: airlied@gmail.com, arthurgrillo@riseup.net, corbet@lwn.net,
	dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
	jeremie.dautheribes@bootlin.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	mairacanal@riseup.net, marcheu@google.com, melissa.srw@gmail.com,
	miquel.raynal@bootlin.com, mripard@kernel.org,
	nicolejadeyee@google.com, pekka.paalanen@haloniitty.fi,
	rdunlap@infradead.org, rodrigosiqueiramelo@gmail.com,
	seanpaul@google.com, simona.vetter@ffwll.ch, simona@ffwll.ch,
	thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: Re: [PATCH v16 3/7] drm/vkms: Drop YUV formats TODO
Message-ID: <Z5zJ1h91AINbQRVF@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	airlied@gmail.com, arthurgrillo@riseup.net, corbet@lwn.net,
	dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
	jeremie.dautheribes@bootlin.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	mairacanal@riseup.net, marcheu@google.com, melissa.srw@gmail.com,
	miquel.raynal@bootlin.com, mripard@kernel.org,
	nicolejadeyee@google.com, pekka.paalanen@haloniitty.fi,
	rdunlap@infradead.org, rodrigosiqueiramelo@gmail.com,
	seanpaul@google.com, simona.vetter@ffwll.ch, simona@ffwll.ch,
	thomas.petazzoni@bootlin.com, tzimmermann@suse.de
References: <20250121-yuv-v16-3-a61f95a99432@bootlin.com>
 <20250131084045.2874-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250131084045.2874-1-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedufeehgfefieeileeukeetfeduvdeiffeuhfdvleevfeefveelueduleeftdejteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegrrhhthhhurhhgrhhilhhlohesrhhishgvuhhprdhnvghtpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepughri
 hdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgvrhgvmhhivgdruggruhhthhgvrhhisggvshessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: louis.chauvet@bootlin.com

On 31/01/25 - 09:40, José Expósito wrote:
> Hi Louis,
> 
> Thanks a lot for the patches.
> 
> I'm not well versed in YUV color formats, so I did my best reading the kernel
> documentation before reviewing this series... But I'll most likely ask some
> basic/dump questions.
> 
> > From: Arthur Grillo <arthurgrillo@riseup.net>
> > 
> > VKMS has support for YUV formats now. Remove the task from the TODO
> > list.
> > 
> > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  Documentation/gpu/vkms.rst | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> > index ba04ac7c2167a9d484c54c69a09a2fb8f2d9c0aa..13b866c3617cd44043406252d3caa912c931772f 100644
> > --- a/Documentation/gpu/vkms.rst
> > +++ b/Documentation/gpu/vkms.rst
> > @@ -122,8 +122,7 @@ There's lots of plane features we could add support for:
> >  
> >  - Scaling.
> >  
> > -- Additional buffer formats, especially YUV formats for video like NV12.
> > -  Low/high bpp RGB formats would also be interesting.
> > +- Additional buffer formats. Low/high bpp RGB formats would be interesting.
> 
> I see that you implemented support for 6 DRM_FORMAT_NV* formats, but
> DRM_FORMAT_NV15, DRM_FORMAT_NV20 and DRM_FORMAT_NV30 are not implemented.
> 
> The same applies to DRM_FORMAT_Y210 or DRM_FORMAT_YUV410 among others.
> 
> Could it be useful to implement all of them in the future? If so, should we add
> it to the ToDo list?

I don't think we need "all of them" (there are ≈100 + all the modifiers), 
but definitly all the commonly used ones (I have some of the "common" one 
ready here [1], I just wait for the YUV series to be accepted to avoid 
conflicts).

> It might be a great task to get started in kernel development, as there are
> already similar examples and tests.

I don't think we need to specify which format are missing, the point 
"Additionnal buffer formats. [...]" seems sufficient. If you think this is 
relevant, I can add "Easy task" so beginners will find it easier?
 
[1]:https://lore.kernel.org/all/20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com/

> >  
> >  - Async updates (currently only possible on cursor plane using the legacy
> >    cursor api).
> > 
