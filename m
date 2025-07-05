Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E521F418F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 08:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751703006; cv=none; b=UX73PfkBhJkZz87RhpqjfghrW16iYvkVAxOHWOQ5dd8+8/5deoY0wmNtBj/nFXmgolWhKFMOnXwDYtppwWBm+UqjGgdGn5hcbB0cZ+gbwAV3TotEqLYAO8oAifQPkDC1+3a48aO4Dehqk0B/auc1oZYTN5tAaDeX7YiqaTLzvdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751703006; c=relaxed/simple;
	bh=w7ia8uSDvR3liJf1GisDTQlQZFSJiC6f3b+nqIE1ujQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qskY9oFKGUYu7WNe68jMp4EgI0uqJwNQ9T33UlhxjfHLSlh0blvJP6jt99WA72W63yWbUrh2Hzrnk9vgfOpCzXYa/sfIrrJqPSlOojCnPqYHmbY3/Rsm+1DEd0VnWd4K7xC06dy0wILoMZLoo/vOBscw7YmIP//kJY3s5t8ngsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 8C8582C051D7;
	Sat,  5 Jul 2025 10:09:55 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 6749A41E00E; Sat,  5 Jul 2025 10:09:55 +0200 (CEST)
Date: Sat, 5 Jul 2025 10:09:55 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Yaron Avizrat <yaron.avizrat@intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Ofir Bitton <obitton@habana.ai>, linux-kernel@vger.kernel.org,
	Dave Airlie <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Jason Gunthorpe <jgg@nvidia.com>, Koby Elbaz <koby.elbaz@intel.com>,
	Konstantin Sinyuk <konstantin.sinyuk@intel.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: Change habanalabs maintainer
Message-ID: <aGjd01Lyn5reVAEN@wunner.de>
References: <20240729121718.540489-1-obitton@habana.ai>
 <20240729121718.540489-2-obitton@habana.ai>
 <dc139f06-3f5a-4216-93c2-1e8b3b9c27ba@intel.com>
 <87cyevy9k0.fsf@intel.com>
 <f543ec81-1092-4700-b695-c4126f122444@intel.com>
 <Z8q6pCmCnVCCvBJK@GABBAY.>
 <be353276-3dce-49c1-8a35-164a33ddb9f9@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be353276-3dce-49c1-8a35-164a33ddb9f9@intel.com>

On Tue, Mar 11, 2025 at 10:25:05AM +0200, Avizrat, Yaron wrote:
> On 29/07/2024 15:17, Ofir Bitton wrote:
> > I will be leaving Intel soon, Yaron Avizrat will take the role
> > of habanalabs driver maintainer.
> >
> > Signed-off-by: Ofir Bitton <obitton@habana.ai>
>
> Reminder: can someone pick it up, please?

Applied to drm-misc-fixes with Yaron's, Jani's and Oded's acks.

Please submit a follow-up change to add Koby and Konstantin as
co-maintainers.

I'm picking this up despite Jani's request that you send a
pull request because retaining outdated MAINTAINERS entries
for a *year* is untenable.

Thanks,

Lukas
