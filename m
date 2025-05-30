Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B319C1EB5D8
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748596060; cv=none; b=HVWGgFRu5CLVtIURio40Uiz23+qgx2NTYQwiHCIBsiulxGGsC/hwpfKVhktiVWiW0+YT15a3AHD9c3XIBmRVxviZ4h0yBhRdBK6CSoyZlBvaLQJffFxHhlCMUIsHBsiDxrec7Tc/HBzOJm61v6oHCO5TX4mmlobL8ucppR2TJ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748596060; c=relaxed/simple;
	bh=h+TkNw1WSw5h2ie4iNPmD4FUqfKlAYlww7F89EL7Zj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pE+gbp6NcYWMYBqSGkRWlH02VeMaP1UbyG3l/OvNqV1AsEY7XF5tzndph+CefFiPtHIkm2vQry2pLvrlxcqfgIvNiJqh6nDXo6DfCWskF+9r1py4nbkT8VtBbF9F5P/nHyBcQ7yFxOzphIWq+t9jIbnOXqQWRmRtpq8TlURqA0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bfGIKTkI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bfGIKTkI"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4508287895dso16088895e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748596056; x=1749200856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TBoLdDgTszvKcfmqb+9eLVb2IyFbtgcQV42UVzWvyCE=;
        b=bfGIKTkIbHwJ+9159+XtKHc/+B8CbqncqsKUB0RdiW/swP7j1VTEDyd1s65kS5HzbF
         W7FSgVKOGrG05f75afqWkX8Fduc42BFl5Rs9V7+Bp7wHqNEB8fEHLRh8uZASjawhOOef
         xLkPL4Tv2he21nYyZR0k8nNbQeGPiqiaNnwd+8t2QJAxSkN9C3V/ApVSs0OuyFjnOHym
         8WkvNzGb1o5lvGvcVX5BI4ckg6s5TQl3+BMe5mOdirqxbNWDxasa9+b3bP5TfnU0VM8J
         MMlhPyQbCMLprSI/24iYsfZMurk8REyXTC9aCc/MVH5c+EsQvzW51h+ZGllWFAxG64Mb
         eYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748596056; x=1749200856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBoLdDgTszvKcfmqb+9eLVb2IyFbtgcQV42UVzWvyCE=;
        b=kbra0hL/OCX88URHcxPTyaK9MQ9asiMcAqlzxZnc7m18JRCJBZUv3LNib7KoBnaCDm
         5bhsjtMVUZCkN8KmYvBF+q/L00kuV1ZiXCyhxiBDEtSViKiUdmM0L5CFHC1T/rTMUZbO
         SJjNszbvGwbeLFerOcT/MPI3xnTeWzf9iW2SHqXYLqJv51zGTsMosslf2bTCPeJ2ipt7
         SznT7RgyzkZ7ig2PsnZdGfX0QyGi/9E8xMP13g9moy0iOQnjqaZp4VP49vNUxr03PF4O
         pI1wz3amltNuWE3cPFKf8re3nq94//BLFyYmm7hrqKIIuaVfw4vTcMIYKyXu+X8Gg5zC
         3QOw==
X-Forwarded-Encrypted: i=1; AJvYcCUd56A8fkxhCpVefZdtL+WYj4O1gLKblmqvUX4wu1g0B0JrcDTuWM4rlROT81HAqhXCWei3L6cyGS0kY6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YypjMNVs93U0q0FIzqJHIJy7/GszR7ht7W1KbV2Gs25+HjuPWA8
	weSs9ItLsp6MB19d/iU0+Jl+0Ro/Dj6Cl0tBOT2n0ETjJierFNGVd9XBU4Wgj593R0U=
X-Gm-Gg: ASbGncukCeO9WP66NVRdJbLzwmYU6H4RNNv+NGpOEVxbbfrJielcKyznSLk3WP8HTzV
	lK0oViMlNH8X59HPz/gqKCjTLHArYw/5UwhSCn36qhKuyay67CBBOvzESahIoSFX/x+CgnkwcoC
	6oNlJWE04jC3BwQAPXhse+iCWZOVizqMFxUkASnXlAAriemvpVjVi3oyPsf8y7yJlPsvlYQxd8V
	DlTgoyfFx2f/RS3Dll/aGV8mT2YF53hVycOXT9gBqN/3eoXz//QDvlID2k3Ln5q3a5AkxYatRMH
	NubEofJCk9t39/ibhJJFlXYA8Xx9RgwxwPcZOJxmBF+twFRqw3y/BfUs84C/x3/fvakK245pUcE
	inADWmBgfTQ==
X-Google-Smtp-Source: AGHT+IEqyiCNMlturDlCUFIxx4iLoEZ93zytjOhgqluhNHe7ssc/aGQOO2bx+VoGalmOEoFz61oKqg==
X-Received: by 2002:a05:600c:34cd:b0:450:c9e3:91fe with SMTP id 5b1f17b1804b1-450d69abea4mr18955185e9.0.1748596055760;
        Fri, 30 May 2025 02:07:35 -0700 (PDT)
Received: from localhost (109-81-89-112.rct.o2.cz. [109.81.89.112])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d7f1b0a4sm12546965e9.0.2025.05.30.02.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 02:07:35 -0700 (PDT)
Date: Fri, 30 May 2025 11:07:34 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Cc: Baoquan He <bhe@redhat.com>, Donald Dutile <ddutile@redhat.com>,
	Jiri Bohac <jbohac@suse.cz>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
	Philipp Rudo <prudo@redhat.com>, Pingfan Liu <piliu@redhat.com>,
	Tao Liu <ltao@redhat.com>, linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>
Subject: Re: [PATCH v2 0/5] kdump: crashkernel reservation from CMA
Message-ID: <aDl1ViMpK_6q_z06@tiehlicka>
References: <Z7dc9Cd8KX3b_brB@dwarf.suse.cz>
 <04904e86-5b5f-4aa1-a120-428dac119189@redhat.com>
 <427fec88-2a74-471e-aeb6-a108ca8c4336@redhat.com>
 <Z8Z/gnbtiXT9QAZr@MiWiFi-R3L-srv>
 <e9c5c247-85fb-43f1-9aa8-47d62321f37b@redhat.com>
 <aDgQ0lbt1h5v0lgE@tiehlicka>
 <a1a5af90-bc8a-448a-81fa-485624d592f3@redhat.com>
 <aDlsF5tAcUxo4VgT@tiehlicka>
 <e0f7fc1e-2227-4c6b-985a-34a697a52679@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0f7fc1e-2227-4c6b-985a-34a697a52679@redhat.com>

On Fri 30-05-25 10:39:39, David Hildenbrand wrote:
> On 30.05.25 10:28, Michal Hocko wrote:
[...]
> > All that being said I would go with an additional parameter to the
> > kdump cma setup - e.g. cma_sane_dma that would skip waiting and use 10s
> > otherwise. That would make the optimized behavior opt in, we do not need
> > to support all sorts of timeouts and also learn if this is not
> > sufficient.
> > 
> > Makes sense?
> 
> Just so I understand correctly, you mean extending the "crashkernel=" option
> with a boolean parameter? If set, e.g., wait 1s, otherwise magic number 10?

crashkernel=1G,cma,cma_sane_dma # no wait on transition
crashkernel=1G,cma # wait on transition with e.g. 10s timeout
-- 
Michal Hocko
SUSE Labs
