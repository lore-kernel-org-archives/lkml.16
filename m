Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F071DD877
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750953423; cv=none; b=mTv/nwqwRTHuqmv8snmjgIH5Hcajp7RUiNTt1CB9JJDeYaQC4WCaPLN1+4G39mTw+IsjW42LIeyd3EP0vnIBmL7FsGdIx2hvh7Jfz/Ik490znSqVxmiyBYhDfkACnn1Pu3eCmk+02lu3h4i1VyRNKo9OixDmCIa9m7AevJ0LD5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750953423; c=relaxed/simple;
	bh=LUc67/E9VCr1cFPrdu697pB+JoTGoLf53uACxaIJWlI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f37kR53LUoxnUknKTDI4v2two7gejq31ahrXlQJyzxHkh4WEvyXDzALJU8d5SyP1WszPJTgbfHUpM7zdsWxWCzSEHJjCIRdmkdOXvi0uNONivkh7aewEgDioA4zjK63+6Hd+KYe5maJYJVNNOQ+ref+mw01SKJcqmhRrbouvF+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dvpT8Q1X; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dvpT8Q1X"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-74ad608d60aso973165b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750953421; x=1751558221; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kK26JsfMXG5BvdX4VYTi37MDUraLIqNaNeqi3JbJPnw=;
        b=dvpT8Q1Xj/WipTKieyDqknq83fMyPbRYYmcULt5ZMt5raDmme8EEhAjCvm62gK5UsM
         9ykNmUL7g5vEYWFgzqgOH+CDy81HBvKUK0RxCTqC9tidZqszoOfk1NG4RDik33JjbdyT
         c1MMxZmMAjLkE5Nu9FQwOqh+7VNSijugUHQO2CbhXFOMCUStxFeO8+OcqUuygcny6CSY
         Sk3HjWke8jA62WsuVRlPDcIORnQ9H3asCbaGREejHhwQIfBqcC+L7jnFO3CQsNagrY5r
         rPI4l0UKKXc+kgV5aa9HZbcfOnZ/MT/lc39q0ycDaRZYLoasOQAa8JfwyRI/ekj3+kPX
         QQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750953421; x=1751558221;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kK26JsfMXG5BvdX4VYTi37MDUraLIqNaNeqi3JbJPnw=;
        b=HYePdVIyXAzS5sDDh/SIwtzQMc9JYvlJCDI03FtJmeF7g1oOMHnanH0xBEKA41N9wb
         gL1pxRbRhmv3/le2vaVXwU/CArg69ilesfJjK6oxvVyGQ2Afb3BGgMZwbchMRqKw6G2/
         NKSbo4a+CNipNbinzXl7KEqgoKP8LqdYU45Gq/WiEZ+w99BTLvkve5R2p/1SNzWOB/+6
         DbstG5xMziFXjIupSuMBGSaeu5EO1btG4+1mUJxUXXQiR+FAFYo+DTBnXjivnJ+ex4/I
         yPkQ0TEQucrVH8voEnkZMJbISgx7frbGpzpXME5l356Wu95BEI9smB3DhWpdUUks3dHv
         ovZA==
X-Forwarded-Encrypted: i=1; AJvYcCVFSbM/+JS4rzOnjf3+/9ZP+XQxj2/lkH52hyofnTufNYOIgVtjrXQsYSH/xlBcU1JjENjiuV1q+NO3rIo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8DWPq7iPu8Jvc0XIj7KCPhTMNbWLefZhrtcCTAMEZM0iF7qdz
	sY+BKx78PO0XkUw0F6t33pTGzmt//ajA2OotZZvNtigvGkOeu+q/7Vz3TDSz4BlDlGz1+jfIVW+
	1Rw5KbQ==
X-Google-Smtp-Source: AGHT+IHvg2ZJs047RUMluhVoHunFXZhJgSyqtLpN4GzPeZZFYmNAnKpFGRIVktoxih0QIuHcT3viEJm6py4=
X-Received: from pfbdw21.prod.google.com ([2002:a05:6a00:3695:b0:748:df06:a477])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:1581:b0:1f5:6c7b:8920
 with SMTP id adf61e73a8af0-2207f191f5fmr10726625637.9.1750953421474; Thu, 26
 Jun 2025 08:57:01 -0700 (PDT)
Date: Thu, 26 Jun 2025 08:56:59 -0700
In-Reply-To: <20250626171004.7a1a024b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626171004.7a1a024b@canb.auug.org.au>
Message-ID: <aF1ty7P9MnQK7UPr@google.com>
Subject: Re: linux-next: build warning after merge of the kvm-x86 tree
From: Sean Christopherson <seanjc@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Adrian Hunter <adrian.hunter@intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 26, 2025, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kvm-x86 tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/virt/kvm/x86/intel-tdx.rst:232: WARNING: Title underline too short.
> 
> KVM_TDX_TERMINATE_VM
> ------------------- [docutils]
> 
> Introduced by commit
> 
>   111a7311a016 ("KVM: TDX: Add sub-ioctl KVM_TDX_TERMINATE_VM")

Fixed (assuming I didn't botch the fixup).  Thanks Stephen!
