Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2A9272E57
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747651110; cv=none; b=XMYLfEGug/H4dP5PqG1tqPQn0Do0czWGE8kAspvF0h7gIrNsXzRl6rFNOyUEs/pyZ+1pDKNyHznrBhbq4vECxJuSDJXHaTdpZJfiTlx4kv7vXv2EUjVU2yC1QPENovrgfDGUt9oVBeLioPWGqWZdk37EGYYkuCtQdByKkDeOpSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747651110; c=relaxed/simple;
	bh=jMaPnZKwOPE3vgc3hJWAsxSV7zd3OOy7j51dprH2hI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3vi0Dvpj5SIZjTOoBCPTqAtRQBzG8M2OBRRKvSZKGvFyNnYJ/8hWrIx/dXPdJ7r3wzCCpO9qjxB7/2hlfItPVoXhz60nLY3h+VgKye/ZKrioo6EGrPmrt2t+3SjGcXe2b5Hme5MlKyl3aJ+VEp840owQQL5Izw2AUXbVGd9cLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BN+/bd55; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BN+/bd55"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so738088166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747651106; x=1748255906; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jMaPnZKwOPE3vgc3hJWAsxSV7zd3OOy7j51dprH2hI8=;
        b=BN+/bd557Ie4jveqEPvuJGnGmiB0AiT41TVrKEJd6NQxy1ZnnrikBYmqe2Qs9lme8z
         ZvnSeqAOa/VciIS0n9N/ql1xEmsezVBcJ2GTHnGebs4LOkARMXVyN2mg0OTaqTPG8Lc1
         EKNP1I74gTFLMOpHOX2KeQPv4uKKNB8muV/HxChBbHftrgX/eCio6niqwDullsnOJH4J
         4RaokbtvSYZYMqGyBl701GdkePC3xkm8ED4sdUA0d7MZAXIzJvmi4Mu3iV3al5Ou0767
         u9MYmaX+Fo8Q6PJG5dH3mn3ekRnZmNdljhyHPkgQcqFfvOGN7DzMwA+Jw7uS3A3AtBDo
         llxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747651106; x=1748255906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMaPnZKwOPE3vgc3hJWAsxSV7zd3OOy7j51dprH2hI8=;
        b=Aqfc0lnk9uONbLWMtO3v3kEF2urrdXpHvWLFO0xUN4XDn0o/I87NEMTzSppepFJz9a
         iOgfJyU+E1o3f1nW/7Uo+a1R+R7dJn4cDpYOBTfXrdOeptgNw68sWDOJjx2heE8GwSMq
         5GYs1/imV87uXMiPiddimojMdCkVTOTNMjR+i0l8FiKe3/slBds/3rOWjAy9lgBXalpr
         NkjXYFqUaSoCnu+jG1te6JalydAdP8AY82igI3j3pY6Z2Dz4WA3g/Sx9WEzJfijsRXcJ
         5qYl4ALmL2yjzvS4YWD4bzx2t/fTrFqwR9kOXHRJqTf1SdhJo6u+yZoNEKgli0mJ18iu
         M+6A==
X-Forwarded-Encrypted: i=1; AJvYcCWaLucypVvrjjONEvSHQgqWwO/xeyWGtwVzDZX6IGLvdpDVJcQ0mKzW+8yJxYR3YvqrPJN7TQPliElMCRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPHOSHZEIYe9TJGqwjZb9H2RuMusbaMDgI98etg8B+NEa+3yEo
	CJEQk+9BHRGhsxws5/SODLAZsg0WaQ7DU/g1SD5Bk+TrDj7EN9T9IpixJGPg1lr+/td1KNkwwh0
	wTyo0HBm69xkN6JxbllWina4ioWjYPiewaSlLCvNzGw==
X-Gm-Gg: ASbGncurlVe95YzKDuAuf17H5zMJ53lVF/WH2MZcEUlt1UsXcbYaMhFzHJIbJOMpF/6
	VxAtmCZQr4LXyC4UdVS+Sxv8n1GlPopRsKBoJqR9lWtgn69IJVhrmjERro2tX5v2X2ZtDOduZRd
	tNrBpwHxElK35S40MczsCkWn3V2CMEzt4=
X-Google-Smtp-Source: AGHT+IERQ6gVNtm2jfGvs7h1VmhPgqmh5s9ctmNSJ0DLQ8IpwfQ2E6YxSes6NyxUZ3WMm8+21WrrQaejiUt8R8VEd9I=
X-Received: by 2002:a17:907:3d12:b0:ad2:28a0:4248 with SMTP id
 a640c23a62f3a-ad52d45aedemr1183024666b.3.1747651106424; Mon, 19 May 2025
 03:38:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514131240.3343747-1-neelx@suse.com> <20250515144742.GH9140@twin.jikos.cz>
In-Reply-To: <20250515144742.GH9140@twin.jikos.cz>
From: Daniel Vacek <neelx@suse.com>
Date: Mon, 19 May 2025 12:38:14 +0200
X-Gm-Features: AX0GCFtZgxPMG4SkO40DEY5vLgn4EA8MNaPg6H0kKh8rB0z0QS2vtUFJzmprWUw
Message-ID: <CAPjX3FcSigbx4siWMvxUFyeQk3u-WwnWTgqikcDB0vxwwZHFjw@mail.gmail.com>
Subject: Re: [PATCH] btrfs: btrfs_backref_link_edge() cleanup
To: dsterba@suse.cz
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 16:47, David Sterba <dsterba@suse.cz> wrote:
>
> Please write more descriptive subject lines, related to what is being
> cleaned up, and not just a generic "function() cleanup".
>
> On Wed, May 14, 2025 at 03:12:39PM +0200, Daniel Vacek wrote:
> > This function is always called with the LINK_LOWER argument. Thus we can
> > simplify it and remove the LINK_LOWER and LINK_UPPER macros.
> >
> > The last call with LINK_UPPER was removed with commit
> > 0097422c0dfe0a ("btrfs: remove clone_backref_node() from relocation")
>
> While removing the code is ok, looking to the git history I think
> there's probably more, related to the node linking. Here it's removing
> one half (LINK_UPPER).

I'm not sure what you mean here. I mentioned the commit you suggested.
Checking the rest of edge linking I don't see how it could be
trivially simplified further.
