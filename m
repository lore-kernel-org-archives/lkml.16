Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD02152DE7;
	Mon, 30 Jun 2025 06:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751265385; cv=none; b=J3wqwm8heX4sZq/Rqd8W35Xw447Q0e/GJ5QY3uvxx0lU2LB5gGqirTzXFoJ2dpLumKnsAWFEHm9CDS2q+36pMATkxYsmzS0DeLc0ob/VmyoFKNUhoOJVQmK5tXZqeaRgd/z6PZqZiDdFHyqCH3O5ZTU0+coU88aQ2WzRXD66DMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751265385; c=relaxed/simple;
	bh=3ce2rZuTOIiUfkOYOF5i+V6mlSLG61fiLuBF5tCoqLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V98qxqqN1epeNCSug0MxkcGVi1c+YNroWtTcv98C1IcwL1qRsONW2soEdLkEH7J2vxGTF+X9KKqEniVCpwSIJbSsiNMkuLcNG9i/yBjftnu36ieyBxVPYJvUYAjDgRMi0SkVEwB5PFkkjnF31jke9RvW56d0/m2xphh4uJrz0GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id E36C468AFE; Mon, 30 Jun 2025 08:36:19 +0200 (CEST)
Date: Mon, 30 Jun 2025 08:36:19 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dmitry Bogdanov <d.bogdanov@yadro.com>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@yadro.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] nvmet: fix memory leak of bio integrity
Message-ID: <20250630063619.GA29641@lst.de>
References: <20250625114533.24041-1-d.bogdanov@yadro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625114533.24041-1-d.bogdanov@yadro.com>
User-Agent: Mutt/1.5.17 (2007-11-01)


Thanks, applied to nvme-6.16.

I fixed up the commit message to include a Fixes tag and drop the
mailing list reference.
