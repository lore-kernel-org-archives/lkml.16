Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503021E376C;
	Wed, 29 Jan 2025 18:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738176508; cv=none; b=Kd7hKhPHnPn4Ko2nmVSHMkRRQrX3sHGyipWBSnHMZu4EH4VcXQHFMzKQTiiBjLt2y/EYqYHTr8+iwNGbgwl8OsMikyK8fLl6JqBm+eG4ZcI34tXargUNL/a0HGD2tRmpPvk5X0U8CibXyPQXniUX3Yd4n/9tLxrPURQPe5t8uKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738176508; c=relaxed/simple;
	bh=5x5C3oXKgTMBkuDA8TFCAbx9AmZk4D3MjTvrIrifUXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JZskeGeEgCrJUlzBfA8gOoUp9+e6WbNBupNqe+LGTOY8hfvN00Q6BlretomnJWG74DyCj8n0We8CX0060WO8ywZCTLRoyACXe4TpGURvREpr8ZSFasvBui8rJLaW7viaGEdmtP/9KQFJd8cIVgyinVxNdJ02vea7cY3FmhVKmcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvX932J5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvX932J5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B5BC4CED1;
	Wed, 29 Jan 2025 18:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738176507;
	bh=5x5C3oXKgTMBkuDA8TFCAbx9AmZk4D3MjTvrIrifUXk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=DvX932J5IFZQf2YexIlDBTZ5Df9aWNzivuNpCN5l7X4KAeZwbG0RZ0NyHVY8Hoi3x
	 4HvDF7qV+6rNmC84cpQZE22mdmEfWpz1LtheIrgOA4lWfW7gGfCDe2afYg4yMGcGE+
	 ecyPV2je07PaXbi8BzPgoPNTwFNg4V6myMKgUiCEwJ3Sogm9GtaJDhCNMYegeAvWqb
	 /nxRHnPUyJJPdIi5+qliYETKlYoBWLt8HNvGgKrfobvjvOKX3KkYkRy8esy6Fse3vl
	 k1TVeaVbk1Qk7dkdv7GAuLkFDJyLE1cjyi2D3+iO/S3SXLPFvKRfnaGvAVGaNtmmIt
	 5oGFcJOGrkdLw==
Date: Wed, 29 Jan 2025 12:48:25 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
Message-ID: <20250129184825.GA484760@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5mOKQUrgeF_r6te@mail-itl>

On Wed, Jan 29, 2025 at 03:10:49AM +0100, Marek Marczykowski-Górecki wrote:
> On Tue, Jan 28, 2025 at 07:15:26PM -0600, Bjorn Helgaas wrote:
> > On Fri, Jan 17, 2025 at 01:05:30PM +0100, Marek Marczykowski-Górecki wrote:
> > > After updating PV dom0 to Linux 6.12, The Mediatek MT7922 device reports
> > > all 0xff when accessing its config space. This happens only after device
> > > reset (which is also triggered when binding the device to the
> > > xen-pciback driver).
> > 
> > Thanks for the report and for all the debugging you've already done!
> > 
> > > Reproducer:
> > > 
> > >     # lspci -xs 01:00.0
> > >     01:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Express Wireless Network Adapter
> > >     00: c3 14 16 06 00 00 10 00 00 00 80 02 10 00 00 00
> > >     ...
> > >     # echo 1 > /sys/bus/pci/devices/0000:01:00.0/reset
> > >     # lspci -xs 01:00.0
> > >     01:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Express Wireless Network Adapter
> > >     00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> > >
> > > The same operation done on Linux 6.12 running without Xen works fine.
> > > 
> > > git bisect points at:
> > > 
> > >     commit d591f6804e7e1310881c9224d72247a2b65039af
> > >     Author: Bjorn Helgaas <bhelgaas@google.com>
> > >     Date:   Tue Aug 27 18:48:46 2024 -0500
> > > 
> > >     PCI: Wait for device readiness with Configuration RRS
> > > 
> > > part of that commit:
> > > @@ -1311,9 +1320,15 @@ static int pci_dev_wait(struct pci_dev *dev, char *reset_type, int timeout)
> > >                         return -ENOTTY;
> > >                 }
> > >  
> > > -               pci_read_config_dword(dev, PCI_COMMAND, &id);
> > > -               if (!PCI_POSSIBLE_ERROR(id))
> > > -                       break;
> > > +               if (root && root->config_crs_sv) {
> > > +                       pci_read_config_dword(dev, PCI_VENDOR_ID, &id);
> > > +                       if (!pci_bus_crs_vendor_id(id))
> > > +                               break;
> > > +               } else {
> > > +                       pci_read_config_dword(dev, PCI_COMMAND, &id);
> > > +                       if (!PCI_POSSIBLE_ERROR(id))
> > > +                               break;
> > > +               }
> > >  
> > >     
> > > Adding some debugging, the PCI_VENDOR_ID read in pci_dev_wait() returns
> > > initially 0xffffffff. If I extend the condition with
> > > "&& !PCI_POSSIBLE_ERROR(id)", then the issue disappear. But reading the
> > > patch description, it would break VF.
> > > I'm not sure where the issue is, but given it breaks only when running
> > > with Xen, I guess something is wrong with "Configuration RRS Software
> > > Visibility" in that case.
> > 
> > I'm missing something.  If you get 0xffffffff, that is not the 0x0001
> > Vendor ID, so pci_dev_wait() should exit immediately.  
> 
> I'm not sure what is going on there either, but my _guess_ is that the
> loop exits too early due to the above. And it makes some further actions
> to fail.

Seems like a good guess worth investigating.  Maybe log all config
accesses to this device after the FLR and see what we're doing?
