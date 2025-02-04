Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814DE2135D7
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738677704; cv=none; b=Wodde1/TDU9utm1lb6nN7xEAYxF0jMa2WAug0AQuLT+xhqxVWs6D2bDAD3MVEe1xnY9Z8LqrSCGgzSJHRVpXioPJ0rhIGtUrB1+d/TDChpJdn1TyptRr+HfH9WM1+sbSlHohF2G3PpaRQeZKxXlpDSQR6oKEboF9OYZywg9q51E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738677704; c=relaxed/simple;
	bh=PqrLRAGcdbFP4qhOIlstX3ObLf5xxCxyFhwGj/96MkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9brZMxSU/ZiPyw8hwGmrD9rYhySPZ+Q0WhV9O9kpdDuFN14BaTP4Rsj3hJueJry09D750AWay2hec8ESFsBj/iJPDP7rOHzsOtsP6xz4hrFwnjRlc1zx6KmKv6vFzjcShig1MHZcS9t+fVwC/0UafkEfvJOhQvfusSbL6SdVuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kk6lWmFr; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kk6lWmFr"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40C7444354;
	Tue,  4 Feb 2025 14:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738677699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iV4HY43D8YBDInRkLNtBLtXbejuJfcBIR7X4fw6b3qQ=;
	b=kk6lWmFrL6INz6asbRE7U5HpPN8DccYIWFuLRhxJQoF/2gqmvYqCvHf9D9JvuPpJc767k+
	JEROg1nvKqhM7Dn7I+j9ok8C3DqBrVub+VPhilWGZP+7tslQ4mhX4JVsY7OAwXcugkMxBt
	9QshQhPDtlyZmz246kVi/bDUARsaRZLurjcQxn3TXvFo9MiHHpPuRufwlWBFRczgWJWLTP
	Eth3FKOmZQvfp9ysta8BQHLQaXKpWHR2N+bZzA1qmXWdEi+nAngWSY/ybezlu6Qw6j1Al+
	YoaG0YT1URtGK8CnesgnhDk4fsqlAX1M0yFpsqbP9V7DC2EMPYTQAvtesji7aQ==
Date: Tue, 4 Feb 2025 15:01:36 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Paz Zcharya <pazz@chromium.org>
Cc: David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Sean Paul <seanpaul@google.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Drew Davenport <ddavenport@google.com>,
	linux-kernel@vger.kernel.org, Paz Zcharya <pazz@google.com>
Subject: Re: [PATCH v2] drm/vkms: Add support for ABGR8888 pixel format
Message-ID: <Z6IdwJmRDKD8TUiT@louis-chauvet-laptop>
Mail-Followup-To: Paz Zcharya <pazz@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Sean Paul <seanpaul@google.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Drew Davenport <ddavenport@google.com>,
	linux-kernel@vger.kernel.org, Paz Zcharya <pazz@google.com>
References: <20250129142238.562999-1-pazz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129142238.562999-1-pazz@google.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhfefhgffgfeelveekvdejfedufeegffdvkeeileeuhedthfegjeeikeehheeukeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepphgriiiisegthhhrohhmihhumhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesg
 hhmrghilhdrtghomhdprhgtphhtthhopehsvggrnhhprghulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghh
X-GND-Sasl: louis.chauvet@bootlin.com

On 29/01/25 - 14:20, Paz Zcharya wrote:
> From: Paz Zcharya <pazz@chromium.org>
> 
> Add support for pixel format ABGR8888, which is the default format
> on Android devices. This will allow us to use VKMS as the default
> display driver in Android Emulator (Cuttlefish) and increase VKMS
> adoption.
> 
> Signed-off-by: Paz Zcharya <pazz@chromium.org>

Applied on drm-misc-next, thanks.

Louis Chauvet
