Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446A1206F27
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882948; cv=none; b=RGBARgBX9iCYKM909xIRJOUWcbvvKVS6aQTaTOuCIvKbY7SA4oLuutKhn9yfohh/1LbyOwCjhVxsbNKi2WptDV9/dhF7y5FpUYVtSFP3QWHXE0z9w0Ks+NFQ6OFltsFKSV/VXRqBJAoku4KgmpiesxW3OYaMpfPRI8TZaEWr07w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882948; c=relaxed/simple;
	bh=Zuo9lxXxt4C7q32ighRyHu9B7RDjt8KoJIH+iGuZV2I=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=THpcnODHj216z0LeYHAOPDr/1glxEFKbuPLdqW7uhaTWTUb20wK2y+BghwLZDvQerEKoplvpd4V2k1jRmpr3Jdq2+R4v4cp2DNe3dvXYylDfE9j+vQl2aczxVoopZ7v06SG/rQLdWC4nrQoZ6JISg/OV8ncl3dUf8kP7NjAHPJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=kV1rd+ok; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="kV1rd+ok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F46C4CEEA;
	Wed, 25 Jun 2025 20:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750882947;
	bh=Zuo9lxXxt4C7q32ighRyHu9B7RDjt8KoJIH+iGuZV2I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kV1rd+okg4YWX8Zw0JN+Pt29Cl1unzDdC7W3bsuKBvIRa+HmrpH3DprBGkqvxcCr4
	 jt9hgmgRge7dEp2bUebc93dNfEdSc1GtJonQFDw8EtlIYp6kXagzu2xKjxykgimQTC
	 DSfael8K/DCzBFWbRwKcYmllShg8t4M4vfqfwyGs=
Date: Wed, 25 Jun 2025 13:22:28 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org, kbingham@kernel.org
Subject: Re: [PATCH] MAINTAINERS: Associate GDB scripts with their
 subsystems
Message-Id: <20250625132228.b072618317afd2fbaaa3aaef@linux-foundation.org>
In-Reply-To: <f9ac32eb-f052-417b-859d-1c8ede2d8daf@siemens.com>
References: <20250625175239.1099848-1-florian.fainelli@broadcom.com>
	<f9ac32eb-f052-417b-859d-1c8ede2d8daf@siemens.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Jun 2025 21:38:20 +0200 Jan Kiszka <jan.kiszka@siemens.com> wrote:

> On 25.06.25 19:52, Florian Fainelli wrote:
> > The GDB scripts under scripts/gdb/linux are very useful for inspecting
> > kernel data structures however they depend upon the internal APIs and
> > data structures which are updated without much consideration for those
> > scripts. This results in a near constant catching up with fixing the
> > scripts so they continue to work.
> > 
> > Associate the GDB scripts with their subsystems in the hope that they
> > get more love and attention.
> > 
> 
> ...
>
> I will surely support any proposal that helps connecting the scripts
> with subsystems they address. However, you should likely break up this
> one here into per-subsystem patches and address each affected
> maintainer. They should have a chance to accept or reject this potential
> extension of their responsibility.

I agree - this proposal doesn't seem very practical, really.

It might actually be harmful - if someone has an issue with a gdb script
they'll report that to the subsystem maintainer rather than to the GDB
script maintainers who are better equipped to address the issue.

And I'm not sure there's really a problem to fix here.  I'm seeing 13
commits to scripts/gdb this year and afaict only one (e0349c46cb4f
("scripts/gdb/linux/symbols.py: address changes to module_sect_attrs"))
looks like it is fixing up such a problem.

