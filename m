Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824645258
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 17:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750614016; cv=none; b=ILhP0zMshn64ulAF+LDbxxh3khW2Du0ja0u02S68ffhkRGgd2ED9LJqKcAtq72jr+t3DaUXPajGPTks4L/eO6TydynOCk61J8yUpSGL7w3RWFEmgc5Hi8ZdZxCPM3xyXPdH0CC2R6IntB5Sdu6y+9R5wHOn8KuMdDJ1UqJdYFeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750614016; c=relaxed/simple;
	bh=JBS6katIuy9abXAwM/EgfQ0vNXuWJoKtGDCgsMvppwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y29TKvgOW9pgvJnQsG/rgwOQBwPr6OcEapfAU6YUw3Udmh7F1fMhuytEn45o2VLcm9coNrVJ/NQvtTjQ/H/3OxlrQ2L0TSb5OSmS2VrvRnzFzMYVPbzCVVnzzPtoe0MImW5iygXM9ZBLtcnKnjaQgi1FI0xyyeUh5uCIzo1Hsng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=qkUd7OyY; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="qkUd7OyY"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a77ea7ed49so22259941cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 10:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1750614013; x=1751218813; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JBS6katIuy9abXAwM/EgfQ0vNXuWJoKtGDCgsMvppwk=;
        b=qkUd7OyYEjZA3lCPXBJ2EiCNjnegCHE58l9b9rp5DFzG3W534etSXmVuSkC8fyOX4c
         2yXHCPoFE9XUeoh2ixdyCTqX7bI9GOse/fsmLV6qJoRGE96GFREHnOSrl+e4eNkhdO/e
         czNg7xL88rWOvVdDmnkcZTQZYyKdCzp/YSWikP66SQS0kZ9xReRjfOGgQZo1rgXHZX4D
         mJ/syG00Vo7x1P8mvuc3go99/o9iGFJ5Vu0DgzaT6F+YbQX9l79sDDxhucVD+ydqscaa
         GNPKD6NQHuoo2Q2R9qwfIH+XxEBc29Snrqnx5KKh3LB9JOBRq/BFyRUoKcQxK5o37gs2
         v3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750614013; x=1751218813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JBS6katIuy9abXAwM/EgfQ0vNXuWJoKtGDCgsMvppwk=;
        b=Ss08o7hAaErUjawww59bh6LQ9oziul4ceeTmzU+sPHWt2h5ZoZKIiJHPR2xHlLv2+e
         snKFdxwqh9tK+deqkChngaSQiN04FhmIeB02ARbG/ts3fHt4ILyjdlwchSwpe5rHmXjS
         y5dymOBj47q0EqHTbTG+2uiozO7BIm7vBRBeSydGlnPJ4WbSPS/YAq2CFc/SV8qmhNVY
         NyOTMYsh7NFv4zZPP55UZyU/jFTXeFrFu3Ji/paYZfvj2Aeh/UH4QPTF08OXmgCs1R2p
         BiJXvwwDG4/3ZXwJj7CkJA1oxwfJ0GEgyugdXU/Eris5sFIlS5/C+u1XoO8FKsxJvydZ
         ZQ4g==
X-Forwarded-Encrypted: i=1; AJvYcCU2O9B6RT51e7wD2zFTVDdtTHuLmiZcd+BVEfjDvWWlDweTfoVXp9jWbRG0jlY+1DS/Lj++TudRGh2wX6U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/LnhODq1+8cvW35Btg7tfqs+kb1b58XqlMIFbkpm8ZlX7KYZy
	IODOufAKhJCs/Ig9SBYgSqDBXy1QVWMGe3DdRfXhyhjo/KMwXUi2okPD8Sgemf2CjMOF3nlWrgJ
	pj8L25uWdWGjV/59JULuX+oS9l163PlryvjiMLYtrng==
X-Gm-Gg: ASbGncs1i5pISiZKGcAcMaPBJF2seU4bkcvUJy7sCdCUfFpr+NDUV3OYUdZgLgDLlT8
	vRzak+HlJD7BGc2qC1M9ZU31t2xyeMpmHuWic0iZGV1IGq3kNOGbCeOlC2c5c5l31ojmPKkTton
	fLLBWcyUzPtdAf+sYjUqFMo3U48KAt4tzdF8hRjPCxXgMWyif69YibAde28e9kGSHGRABQl3T5w
	B0wHlwYzFEnm3YX
X-Google-Smtp-Source: AGHT+IGAQVA4j9B6bOXEQavSPQk4pUsTIQfktiOkSDRcEtYWtj2nMKnJm6GAf6TwLLKYEA7597CW46OoVjUcTVc0rKg=
X-Received: by 2002:ac8:5707:0:b0:494:b247:4ddb with SMTP id
 d75a77b69052e-4a77c2d6173mr135279261cf.4.1750614013493; Sun, 22 Jun 2025
 10:40:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530-rss-v12-0-95d8b348de91@daynix.com> <20250530-rss-v12-1-95d8b348de91@daynix.com>
 <CACGkMEufffSj1GQMqwf598__-JgNtXRpyvsLtjSbr3angLmJXg@mail.gmail.com>
 <95cb2640-570d-4f51-8775-af5248c6bc5a@daynix.com> <CACGkMEu6fZaErFEu7_UFsykXRL7Z+CwmkcxmvJHC+eN_j0pQvg@mail.gmail.com>
 <4eaa7aaa-f677-4a31-bcc2-badcb5e2b9f6@daynix.com> <CACGkMEu3QH+VdHqQEePYz_z+_bNYswpA-KNxzz0edEOSSkJtWw@mail.gmail.com>
 <75ef190e-49fc-48aa-abf2-579ea31e4d15@daynix.com> <CACGkMEu2n-O0UtVEmcPkELcg9gpML=m5W=qYPjeEjp3ba73Eiw@mail.gmail.com>
 <760e9154-3440-464f-9b82-5a0c66f482ee@daynix.com> <CACGkMEtCr65RFB0jeprX3iQ3ke997AWF0FGH6JW_zuJOLqS5uw@mail.gmail.com>
In-Reply-To: <CACGkMEtCr65RFB0jeprX3iQ3ke997AWF0FGH6JW_zuJOLqS5uw@mail.gmail.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Sun, 22 Jun 2025 20:40:02 +0300
X-Gm-Features: AX0GCFu7f7UEMKygSwaRuFS-QXgCw4dhQ6kVLLsvANPI-_VjCLQSaQpxwUYjwO8
Message-ID: <CAOEp5OcybMttzRam+RKQHv4KA-zLnxGrL+UApc5KrAG+op9LKg@mail.gmail.com>
Subject: Re: [PATCH net-next v12 01/10] virtio_net: Add functions for hashing
To: Jason Wang <jasowang@redhat.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
	Andrew Melnychenko <andrew@daynix.com>, Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
	Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Yuri, can you help to clarify this?

I see here several questions:
1. Whether it is ok for the device not to indicate support for XXX_EX hash type?
- I think, yes (strictly speaking, it was better to test that before
submitting the patches )
2. Is it possible that the guest will enable some XXX_EX hash type if
the device does not indicate that it is supported?
- No (I think this is part of the spec)
3. What to do if we migrate between systems with different
capabilities of hash support/reporting/whatever
- IMO, at this moment such case should be excluded and only mechanism
we have for that is the compatible machine version
- in some future the change of device capabilities can be communicated
to the driver and _probably_ the driver might be able to communicate
the change of device capabilities to the OS
4. Does it make sense to have fine configuration of hash types mask
via command-line?
- IMO, no. This would require the user to have too much knowledge
about RSS internals

Please let me know if I missed something.
