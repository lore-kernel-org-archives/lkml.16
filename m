Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0B81F03EB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 09:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743500866; cv=none; b=vGWR2ZgfqtZd7L+fqWQeqYxBYtdQN8SEpwb5PiDWryxsiNC10AdSxDiLBE6KZwsdY/iB31jAisxczkoecH/8En4jQI49nYDogOAFUWTAm7JNd/68g97pE1MsV/zXtPR3yMedL5j1NWsHX+ozCn5TOqoatdt4WKLcPw40I8aYEoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743500866; c=relaxed/simple;
	bh=tHRABw4YqT++vDj1z6XCa+mUWBt15mI93XMbmHZFVKY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASXzHmVOn0f/LmYdEW6Us/TtrPHZ95K8OquDQDFwcfHQqIyt8OwMbpc8+xqGhGShjyKBqjOfBGaRhmFmoZvUGD+6i0LVbMPVXifsV2i9UG7g0ojrSE5UA6WpEqbUbjm8dPIJDWRDztlUwAWB33BHJuVAV5jsrsSoNytKtqVI6mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPjjd56d; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPjjd56d"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30613802a6bso54189371fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 02:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743500863; x=1744105663; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A2C2GeCAVXb2w87kJgVRqcXJ42AgxkPCPtakCiIIfrM=;
        b=iPjjd56dTTiRsicOCtx809ZZ1YsUnHB2duYSwTweMaBKuWfCSPS/yAorMPbkdP+sIT
         3+M+TKxXLrpzOW40QJXO7FSNKbVPIddanaL/nG+krkNredN8/kiC8KLJXvUGpKK5CrcM
         DLnBJC+90pniAzce+/9XGg7RBMiKd2Q/UpwMxws8ikYOay/XcUu3ZTyz2k9feSLLP7uf
         4Pz1wMHG174BNzBJ1lte3INPS5DG5e3KlDLRKE35QPvWEj1ASMndhhks6UcWtQC0HcmC
         DZjKhIJwvLdp9e55iP3RsSNXH7jVl7OqU1y7qGLQsZTr5hhoxJVJybQf+9j1afvORYRC
         RLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743500863; x=1744105663;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2C2GeCAVXb2w87kJgVRqcXJ42AgxkPCPtakCiIIfrM=;
        b=LARjqgCfH8L3ENCqCTgZaVdo7kVDD5quB57u3rQ4BpASzFQmrVXobOqUxgzJiRmlUN
         5X5uJrB3azFOfT4Ig91+hdDEROt3TQ/8Gy3iUdLmiBaYVS6Y21hpOVyrBpcCJV3cugts
         bLUKwFRzC4AsTvjkKXFGzGG8j9rjxyk1ytgr1B53uj63gUy0f1wodWeTON00d3MScWYx
         E5F/RQFHs91U8QctyDtcrsIYHzHYZMXbuf7aGqbVC4b3aZTO78q0rVk0OcmA7Pi5bDhJ
         C2f0cSH+tmKIyBrI98spnl2531052VPVuoIa1HwufanfHPe3k0UCx8t1NfnLysCQzeZN
         /s7g==
X-Forwarded-Encrypted: i=1; AJvYcCUXJXyo9xsgK7Qtg4L86sKWqRSgFmG3nRdLlVqdm3qWH5ST2IqWW8U4Eh3W2Gzhay1f9uKSAVJh9OMb2SM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmwYzh63GIThpmpDafidrQ2jueCMOa0Vsquqp1Jvg2qTmzj7Qo
	DHVtY+Jqd/RoNfbU4HJXVVKJXtMLHrlsxfmDnRKB6/6zwDUEi8rW
X-Gm-Gg: ASbGncuElo4Q8TsEOmUqLjo12geFwk2AVHJNXsO9Z3cYW5QF7ulF5GX8hI5iNqkUYUs
	2ef3DQGMH10TYFFY5Rh5VT+5D82MdPKAUXVurW9sUqpvSboI/Q+aOlddHvp8M5p1cU04gq+h3D6
	rg/o+VBgR00fLsnl2fzjthZxANwhl5aOA+KuCINpqFIJ3rmje4VQTs7OzbYq69WEXaszLVyHdm/
	gHLQPescInlCED/Hb4GJZMoLFSRghwhd+mkkTeNGWMhxDNz/aDYQuLyodaqk1fMByMRkNDmODXi
	U/SO6v9DEL1tMvpH8NEgFi7zqTE8XI6Cg/1V3IxQI8j5TMw5BbdkKRsEkPcVcMe0JI++CUrO
X-Google-Smtp-Source: AGHT+IENbgcGg3711+R6w+jwyK6kVYCIhqUTLTViQxqFJ9DuHKPnU+TSSx7bFn3MjkNaBtp8NsXndw==
X-Received: by 2002:a05:651c:2209:b0:30c:189d:a169 with SMTP id 38308e7fff4ca-30de03286edmr36552341fa.25.1743500862386;
        Tue, 01 Apr 2025 02:47:42 -0700 (PDT)
Received: from pc636 (host-95-203-23-138.mobileonline.telia.com. [95.203.23.138])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2ab84afsm17766381fa.35.2025.04.01.02.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:47:41 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 1 Apr 2025 11:47:39 +0200
To: Huan Yang <link@vivo.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/1] Introduce vmap_file()
Message-ID: <Z-u2O_MO1NWP42kL@pc636>
References: <20250328211349.845857-1-vishal.moola@gmail.com>
 <02ba63ed-ef1c-426d-b469-09878c5f03d7@vivo.com>
 <Z-tGXf5mfTclxZgl@fedora>
 <a3618dd8-5b4d-45d7-b619-1c89ca7fd6b5@vivo.com>
 <Z-tbTWP5MYzwrRYX@fedora>
 <efd24da3-2da2-4acb-be7d-a070a78b80bf@vivo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <efd24da3-2da2-4acb-be7d-a070a78b80bf@vivo.com>

On Tue, Apr 01, 2025 at 02:08:53PM +0800, Huan Yang wrote:
> 
> 在 2025/4/1 11:19, Vishal Moola (Oracle) 写道:
> > On Tue, Apr 01, 2025 at 10:21:46AM +0800, Huan Yang wrote:
> > > 在 2025/4/1 09:50, Vishal Moola (Oracle) 写道:
> > > > On Mon, Mar 31, 2025 at 10:05:53AM +0800, Huan Yang wrote:
> > > > > HI Vishal,
> > > > > 
> > > > > 在 2025/3/29 05:13, Vishal Moola (Oracle) 写道:
> > > > > > Currently, users have to call vmap() or vmap_pfn() to map pages to
> > > > > > kernel virtual space. vmap_pfn() is for special pages (i.e. pfns
> > > > > > without struct page). vmap() handles normal pages.
> > > > > > 
> > > > > > With large folios, we may want to map ranges that only span
> > > > > > part of a folio (i.e. mapping half of a 2Mb folio).
> > > > > > vmap_file() will allow us to do so.
> > > > > You mention vmap_file can support range folio vmap, but when I look code, I can't figure out
> > > > > 
> > > > > how to use, maybe I missed something? :)
> > > > I took a look at the udma-buf code. Rather than iterating through the
> > > > folios using pfns, you can calculate the corresponding file offsets
> > > > (maybe you already have them?) to map the desired folios.
> > > Currently udmabuf folio's not simple based on file(even each memory from memfd). User can provide
> > > 
> > > random range of memfd  to udmabuf to use. For example:
> > > 
> > > We get a memfd maybe 4M, user split it into [0, 2M), [1M, 2M), [2M, 4M), so you can see 1M-2M range repeat.
> > > 
> > > This range can gathered by udmabuf_create_list, then udmabuf use it. So, udmabuf record it by folio array+offset array.
> > I was thinking you could call vmap_file() on every sub-range and use
> > those addresses. It should work, we'd have to look at making udmabuf api's
> > support it.
> 
> Hmmm, how to get contigous virtual address? Or there are a way to merge each split vmap's return address?
> 
The patch in question maps whole file to continues memory as i see, but
i can miss something. Partly populate technique requires to get an area
and partly populate it.

As i see we have something similar:

<snip>
/**
 * vm_area_map_pages - map pages inside given sparse vm_area
 * @area: vm_area
 * @start: start address inside vm_area
 * @end: end address inside vm_area
 * @pages: pages to map (always PAGE_SIZE pages)
 */
int vm_area_map_pages(struct vm_struct *area, unsigned long start,
		      unsigned long end, struct page **pages)
{
...
<snip>

it is used by the BPF.

--
Uladzislau Rezki
