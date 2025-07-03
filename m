Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CA0226D03;
	Thu,  3 Jul 2025 06:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751525164; cv=none; b=boRs5GcUSxQlXhaGD33JDonwo1VuUhIbCRD+q3Lf96VI8DKvdj8IDnU1YF02FrUXwAAXY8kdNaStbNLMkSIO5cAMgsKjcBUG+IouIpHrv3I80G3bkciCj9P9Y5/5knaRTRFDm+pWRNhkA5i42ViG8FacvdQ96hc9MJV9vLkP93Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751525164; c=relaxed/simple;
	bh=B3QnSFNJf2zcbHXXL6CmMgCCoF5Xv2PGQuokDUej7OA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oo5d1wGFiVS9OpTtDpPqXl4jG8BoJRFtvZy56hnbuJgnOmBF8NSGtqdkJnfLfF4VPndLtsITz67lQvpLJEWTMTTTZRxxxnWtSlNiHyX//IP8fQbZax/1Egi3zOSAkOhUH4T6KDy59qkdI7sZ2XkM+D5yRIkyEnppkNWsj4c1BVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oX1ezOc/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oX1ezOc/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C6CC4CEE3;
	Thu,  3 Jul 2025 06:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751525163;
	bh=B3QnSFNJf2zcbHXXL6CmMgCCoF5Xv2PGQuokDUej7OA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oX1ezOc/LeEsEsyNRlk0d1zxPdfmVlO9513qnMZN2I7fKFqHCbP/ZLtU1+HCO97Jw
	 ud4znRPPZa1evYjl1lpVe2r5VrUQMhIg++PvUg0m9mFgf6GxYyHre1DSzbMUT48oVA
	 5r4PbRkGKV7V9HeNoa61XU/yQv6QnNv098OWVu6A=
Date: Thu, 3 Jul 2025 08:45:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lin Ma <linma@zju.edu.cn>
Cc: wkang77@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v1 1/2] staging: gdm724x: fix type confusion in
 gdm_lte_event_rcv()
Message-ID: <2025070355-uncommon-handlebar-c6f3@gregkh>
References: <20250703052723.14616-1-linma@zju.edu.cn>
 <2025070343-halves-prison-c40f@gregkh>
 <97e5af3.9183.197cefa02cc.Coremail.linma@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97e5af3.9183.197cefa02cc.Coremail.linma@zju.edu.cn>

On Thu, Jul 03, 2025 at 02:29:40PM +0800, Lin Ma wrote:
> Hello Greg,
> 
> > > @@ -522,6 +522,9 @@ static void gdm_lte_event_rcv(struct net_device *dev, u16 type,
> > >  {
> > >  	struct nic *nic = netdev_priv(dev);
> > >  
> > > +	if (dev->netdev_ops->ndo_open != gdm_lte_open)
> > > +		return;
> > 
> > Why should a driver be poking around in netdev_ops?  That feels wrong,
> > what would ever change this?  Why not fix that instead?
> > 
> > thanks,
> > 
> > greg k-h
> 
> Yes, it seems that comparing ops is quite ambiguous and weird. However, investigation on
> code shows various checks against net_device.
> 
> - by `dev->priv_flags`. See is_vlan_dev()
> ```
> static inline bool is_vlan_dev(const struct net_device *dev)
> {
>         return dev->priv_flags & IFF_802_1Q_VLAN;
> }
> ```
> 
> - by `dev->rtnl_link_ops->kind`. See lookup_interface()
> ```
> static struct wg_device *lookup_interface(struct nlattr **attrs,
>                       struct sk_buff *skb)
> {
>     dev = dev_get_by_index(sock_net(skb->sk),
>                        nla_get_u32(attrs[WGDEVICE_A_IFINDEX]));
>     ...
>     if (!dev->rtnl_link_ops || !dev->rtnl_link_ops->kind ||
>         strcmp(dev->rtnl_link_ops->kind, KBUILD_MODNAME)) {
>     ...
> }
> ```
> 
> - by `dev->type`. See ax25_device_event()
> ```
> static int ax25_device_event(struct notifier_block *this, unsigned long event,
>                  void *ptr)
> {
>     struct net_device *dev = netdev_notifier_info_to_dev(ptr);
> 
>     ......
> 
>     /* Reject non AX.25 devices */
>     if (dev->type != ARPHRD_AX25)
>         return NOTIFY_DONE;
> ```


Those are core functions that all drivers are using, and the "type" of
device is also ok to look at.  You are trying to compare a specific
callback in this change, which feels wrong to me.

Wait, what tree are you making this change against?  I don't even see
the file you are trying to patch in the latest tree, are you sure it's
not just deleted already?

> As for poking around in netdev_ops, we didn't know if it is the best solution,
> just because some code did similar checks, e.g.
> 
> ```
> static struct team *team_nl_team_get(struct genl_info *info)
> {
>     dev = dev_get_by_index(net, ifindex);
>     if (!dev || dev->netdev_ops != &team_netdev_ops) {
>         ... 
>     }
> }
> ```
> 
> and
> 
> ```
> static int mlx5e_set_vf_tunnel(...)
> {
>     route_dev = dev_get_by_index(dev_net(out_dev), route_dev_ifindex);
> 
>     if (!route_dev || route_dev->netdev_ops != &mlx5e_netdev_ops || ... ) {
>         ...
>     }
> }
> ```
> 
> From my point of view, using `dev->type/flags/priv_flags` could be a better
> choice if it's okay to introduce more definitions.
> 
> Using netdev_ops is more straightforward. Or maybe I should just compare the
> `->netdev_ops` instead of the `->netdev_ops->ndo_open`?

Again, make sure this file is still present in the tree before going
further :)

thanks,

greg k-h
