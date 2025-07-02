Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D2A235059
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 07:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751442584; cv=none; b=jZAIDsTlfoDLm7oT9KHGBlE5jre2uHvYNmtpv6VhWAJN2c17W0Vi0ZJqgQhb37VcQEueojhaaD9bWF0Pxjk3EybKBIkJ6anPueZuacAGmDVj9EveE8v++MsqTJK2dg02M8JeuxDEs2igSD3NPK2izqO3XHyHLfsvvX84/0uko1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751442584; c=relaxed/simple;
	bh=wy550aMf/ggOmgv9shdxFZ8ZWBU/2PB5ickG7CwT+gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRH01zEkbqJi9U7QFYywYYqSurYc8G2YbsiJadmRtOCZJuqJI149wh3v7ZhC3b7nvUxjwIBkazrmFGt7Kv9roQnFqjylPru9weETT/6zXtOUAZvDHvsJLfbbpdOvI1MLIWw+3L24nm9xxN1KFG920s+UU60ss1xufIOVDTBU8gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JwfaaxaV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JwfaaxaV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E25EC4CEED;
	Wed,  2 Jul 2025 07:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751442582;
	bh=wy550aMf/ggOmgv9shdxFZ8ZWBU/2PB5ickG7CwT+gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JwfaaxaVFOEG5TmQSld/9GytBDSDU8SMAbd3HXEQ0LcElKxFWMH1doHgOPDF6y6pj
	 1TTujYFZ/6TEIgqkkW9sH6MC7Gl6igUH22GFc1lrhTWnfNJOTK25PzXVx++MjGt3uA
	 hJJ5lK6VdfuVQmzxOZrrrdukpJsTGannISNyIzO8=
Date: Wed, 2 Jul 2025 09:49:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v5] drm/vgem/vgem_drv convert to use faux_device
Message-ID: <2025070231-prism-unlatch-e99e@gregkh>
References: <2025070114-iron-shiny-b92e@gregkh>
 <42d0f819-87ae-44d0-a9c5-ae4fa91b1227@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42d0f819-87ae-44d0-a9c5-ae4fa91b1227@suse.de>

On Wed, Jul 02, 2025 at 09:36:40AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 01.07.25 um 12:51 schrieb Greg Kroah-Hartman:
> > The vgem driver does not need to create a platform device, as there is
> > no real platform resources associated it,  it only did so because it was
> > simple to do that in order to get a device to use for resource
> > management of drm resources.  Change the driver to use the faux device
> > instead as this is NOT a real platform device.
> > 
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> > v5: - rebased against 6.16-rc4 and resent as it seems to have been lost
> 
> Not lost, but thanks for the update. This patch and the one for vkms depend
> on "drm/gem-shmem: Do not map s/g table by default". [1] It'll land soon and
> the faux_device updates soon after.
> 
> Best regards
> Thomas
> 
> [1] https://patchwork.freedesktop.org/series/150968/

Great, thanks for letting me know.

greg k-h
