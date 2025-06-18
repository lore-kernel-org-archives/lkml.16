Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375BD2EE5EC
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750258822; cv=none; b=k3wLqnsE66ZpHgKHqjL9HqxzEpafDouxpAMR06NlBRTHGEBWpC9q1CSVSKND4zQ7TIDbjBsyT1MKEHLcTuKQXBtEJrlKnUhg1PWmmtbvc6Eph2T0UM/0Qac7xYHzCyE9gfOBdyYcvfEJ4aQ7sodosWFryC3DdFEPB08RsCcd5+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750258822; c=relaxed/simple;
	bh=1XEQ/vx/9M/0Z/ONOs4n2AjYGm4cFrrb8VsMsNtcnFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQ/UYxxlAC0E1yDLoZBotEYbmHSbHelUiWaV44XjLiaJ+9nRbUfD21JUWtzuWtWi4CPLRVoU3QZTUi2NYuNiluGlfKjGX2JE7g/Gr048TFPTe2gBLUbBIFm89nAC4y3gGVD5KlbpWElm2W4Pd4/z549RebGn2ja76GKrVLknTpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=h1i8J5py; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="h1i8J5py"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c56a3def84so717437485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750258820; x=1750863620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vgoqcy77dCbehp2iwR94a5PWkF4ktryddedGtroeuu8=;
        b=h1i8J5pysj0kqkes3r0sDpAo3XYU36FQDI03BbGvPx6H7klTCgfePtSzr3UifIgc99
         c3SRlz5hvcZBRjsoIqHBDNqRoMP3BtVrGOP5oAA7XtFNiYJ0Cx+d2s9b5yOPUVqZFSF2
         VauIcFB6eerAY495fEFmlOoiXSolVYt7VWxdnm9vIMZrRxLGFcjs/wFsffnmD/I26cuZ
         wgbNjXmBtQJ0iF/jepGJak7spaSnk29Zoj5Un+pcVa4994AKXHBrdzM/nJ45kW8YTA91
         QPzTnytqbvAL3rCCMOTzo46LGoM9xkeofVskPDegZc1qg+tw9duc07ag225SXlQ/VL+M
         QWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750258820; x=1750863620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vgoqcy77dCbehp2iwR94a5PWkF4ktryddedGtroeuu8=;
        b=F39JpTDOT4HUzpY7W3luSuzerH81zBTvFH+f75LWfYM9d2Vx/0X4wSn3PupXnmbP0P
         RBIWlnMHkTWF+FqVc1/Gn0JSZD8zirFdJFN6Twx21ACGHOfsbjXsFPh4Jm28uyG1sOzo
         2CANxgPGsXAJtSCNogR9gEX1CXrQOfuTdJa/B3vggsCTQ4MPWJwFRXomLJdaxW02X+Ax
         pWeRJ1ciuasNKAFX9vIXqnla86J/ne6uQMdbFkchO8ekV1zirIGb/u+e3JVVH9HcBmli
         5SNVsUwe0Lwf5BYRzsBb3VTXZrT05vaGSxiiB/1BnyTcSt5CeWU7FNqP/nWCTUoo80/I
         IwEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVac1gaxfCbtoT2bRGG7NVtqA6IT6TyRVN8s5/bb50E4t14hcYZ+wRtyasoMy/05/BDjEeKDZqY/PpUUyE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2osUM8xr08IrCLzCaceji0lGS8cxG/XmFxyqNmyYbx30cffWA
	K+ygvcLcB/eG0gIaBEh0aQLfRwo6hgTAl3ZoEaLwRi5Zh0eRMPSYHWOaZZA7vNCfagqz6qfrHv+
	j6UNv
X-Gm-Gg: ASbGnctvsq0HkWxD/L4PSfb3Z7SuhoABdyDW7rX5zFkD28Gxqba7KtYwkIvvvGPGNJG
	jAFXEWqsLCaXEGe0v8cXngE+yQc+PXwysvxEbtqpfRKPFGcYqNNuz0mkzqZ2NvW+pIQ3E6s95yy
	m6FzH68Ci8PQDtrhYxkD/StwVQCkREjLSTfNbDOJiVT0PrvxfFDFTXuODW8oeU323tI8Mpq4+Rm
	Su7KQZ8KkUkpBDuXnqJLbBMu6caAnwSUmj1Izsi+HQVzFPpCX1XPj6knGUvCiNUiET95Gvq+bbO
	6wU14xrs02gztj5ZUqQBmT79j0c4t3YQU3MjI//fjL/riL/54+YZNsbKb1DKxBOemVpaSSwLQhO
	YWYCArAJTicu1iL1gdaCMyCNr6xeHiqFlFZ6Cfw==
X-Google-Smtp-Source: AGHT+IEmXnt3uIyq+wbp3haWWpVf5H5IK0A8maNryrSJ2ysQfTpYtx8UqGj3mP+8PAcrc8mbSZcjjw==
X-Received: by 2002:a05:6214:29e7:b0:6fb:15d2:494a with SMTP id 6a1803df08f44-6fb477a51f7mr239650176d6.41.1750258819801;
        Wed, 18 Jun 2025 08:00:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb525553c3sm38390486d6.104.2025.06.18.08.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 08:00:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRuGw-00000006oub-19lH;
	Wed, 18 Jun 2025 12:00:18 -0300
Date: Wed, 18 Jun 2025 12:00:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [RFC PATCH] iommufd: Destroy vdevice on device unbind
Message-ID: <20250618150018.GS1376515@ziepe.ca>
References: <BN9PR11MB5276B467ADCC57BC6571CA458C77A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20250613124202.GD1130869@ziepe.ca>
 <yq5abjqotim7.fsf@kernel.org>
 <BN9PR11MB527633CA2F698E83E12BFBD68C70A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20250616164941.GA1373692@ziepe.ca>
 <yq5azfe6ssev.fsf@kernel.org>
 <20250617183452.GG1376515@ziepe.ca>
 <yq5awm99sjmr.fsf@kernel.org>
 <20250618133527.GQ1376515@ziepe.ca>
 <yq5att4drtj7.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5att4drtj7.fsf@kernel.org>

On Wed, Jun 18, 2025 at 08:22:44PM +0530, Aneesh Kumar K.V wrote:
> > The full sequence I would expect a sane userspace to do is:
> >
> > open(vfio_cdev)
> > ioctl(vfio_cdev, VFIO_DEVICE_BIND_IOMMUFD, iommufd)
> > ioctl(iommufd, IOMMUFD_CMD_VIOMMU_ALLOC)
> > ioctl(iommufd, IOMMUFD_CMD_VDEVICE_ALLOC)
> > ioctl(iommufd, IOMMUFD_CMD_VDEVICE_DEALLOC)
> > ioctl(iommufd, IOMMUFD_CMD_VIOMMU_DEALLOC)
> > close(vfio_cdev);
> >
> 
> And if the user does
> 
> open(vfio_cdev)
> ioctl(vfio_cdev, VFIO_DEVICE_BIND_IOMMUFD, iommufd)
> ioctl(iommufd, IOMMUFD_CMD_VIOMMU_ALLOC)
> ioctl(iommufd, IOMMUFD_CMD_VDEVICE_ALLOC)
> close(vfio_cdev);   -> this should call vdevice_destroy because idevice is getting destroyed here (we will put XA_ZERO_ENTRY here).

Yes, we have to destroy the vdevice internally here

> ioctl(iommufd, IOMMUFD_CMD_VDEVICE_DEALLOC) -> No error, we convert the XA_ZERO_ENTRY to NULL here?

This should probably fail since the user has done something wrong and
it would be the only way to realize it. The failure could clean up the
tombstone, or it could just leak I don't have a strong feeling.

If you leak then using XA_ZERO_ENTRY is easy, if you want to clean up
then you'd have to have a global static 'tombstone object' that sits
in the xarray.

Jason
