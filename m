Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5261DB92C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343574; cv=none; b=FHN12jebm9ekuLHzMK3CmA0Nvk+ZwymmdkjzHmZ288j2WnutTGwaQgsCh3Yg+grPI/pDDoRrbjNf/pHbmb3Kg0ABv1TQ++pnijnqZdyudDVsLPYx+eUkeRjiUk8pSQqVg9tglEaMa0rPs0m0dDshzvtwOXCpxMAVkL7NRTM3c3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343574; c=relaxed/simple;
	bh=f9InoU/zIyvqU5XW8HXwiQiJTHhL6rglkSPoRNyO+GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9HakoLgDp+i6rvwq5vTkdXuP9V/MvUA1SbZbW83189o98xFJPsqTemYXKUGvteYVsPmFIxPG/FEttru2sAtrOxgJa9w5opImzkJVdrD22xSWvQHxRh0zmy0UfGR3BREYaugRpCDOE4uiV1/qf5NrqC14iwE5U9BUVpXcccTadM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=GvXQchXE; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="GvXQchXE"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fada2dd785so9714556d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750343571; x=1750948371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FOkFLnrJzZMHzNUSh+Y/TNE7FFzC3Os6Y5olMIbxKDs=;
        b=GvXQchXEl3AWSvPRrw9kXJ5LSbai5gl1iJhKUTYSPDFknEu6VwyoY8h95pL20AuqNf
         q48Rh2R3Wd2qq+OL5Gr4ePzvQzygkDd2piJ2NygAy0j5gNDXULMQSEYYrZn2t+hzTtVA
         jJSaW184dqfUvXzz0nQzQAjsySZ3fKDwskAxD2Sq16E/Za5iTDrx4ZiILwOGoVtkub6g
         2flxoGZnIcwVBXSkafstycMYf2P9A05Ah4a5ESeBE9wsXWC1MAGsDnPK10GwchPtKVwu
         fADkoVMcCZUdrpCoZYwilXSXTawvFh6MnqnFRwFkTsj9t6fR/uk2cYRlQZD4jIhtJuhK
         gG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343571; x=1750948371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOkFLnrJzZMHzNUSh+Y/TNE7FFzC3Os6Y5olMIbxKDs=;
        b=VQOGaCvaeS5A9Q0jKn3fSVb+gYck1sPLAJ11XiKQ7oiJSTZEkJvKyQa1pmWhqMDcRh
         Hk6KOwnQ0nYoCdBms4OENRd9n5spkpr00gKxvL3B6axFwCUUwi2+MNMfdMdIK91z7KRH
         9ZcgdDXnzVaMEeDwliB7mDbSzoknzKjnUupylK1kxGsrl0oz7eVCaxhgZ/waTM843BMV
         GRLRNRoXOkfxWG9Ga+KAqDGnSe1FPLZtK1pyDLd6T/ZwTmcjVxMix0Fk0QK9nN1515wp
         rP+SO40nIfe+26koqNzUfWucrDtrDcsOe3paG9oM4ymiXwy7gFZFEXOQmkdhgInOVUyF
         Vsqw==
X-Forwarded-Encrypted: i=1; AJvYcCW0d38kFZCMg0qRekr5VmtQsd9Ht1JTy5Vhvoixbh2wgdQsbdFbYObv5kkIj9R8CGCVSkpDVGsgo9s1zsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAr8cSneh/bBYM/D8H1GfkhL8H7P8GfwfdRj0Bg3gP9BrvmMVe
	+5kgBydNOGv5ICxOhFbS0dxO8n7needa+wyuzBDOKu/YeXOIozGTmC8ZAPOMcgbzsw==
X-Gm-Gg: ASbGnctTlvxJRdXxNEmnwL5ef8kANVot6fcrnDo4DBVNMxi8/6C4yUaM38w1FdsyZOc
	+v8XQKQHmRKIby3HnaM18Q+S2xxPH35z/K7MMKlbejU4gasCytyedt9vDNPCqSwFV29iHjl14sa
	vXwq5cY3T4PC9QZ2P+EIYoflZEHVYFge9R35HBrmkhYSc6CIJMSuCqebEsORmtl/j9v5Se6Mklk
	OhspjVAFxm3MeHslbvguFRJXuD4YAvK4wWI37o7DxNZn1zDZHeb2rjOFhvRUaJtPAVEGe5LhidS
	hxwIYpFBWH4nk5j/Y9uJuY7ro6gl4orT90+bvuw5Z0WKT4fnGgDnYfFlYNkjDGQ=
X-Google-Smtp-Source: AGHT+IHxQnCf/LYNTmc/z8v+E308ymSUGqUyJ6EPuGPk72H+rJoxyGsRQCNrsDtAHmaoQiC2Ino8aA==
X-Received: by 2002:a05:6214:19c2:b0:6e8:98a1:3694 with SMTP id 6a1803df08f44-6fb47772defmr361361336d6.8.1750343571359;
        Thu, 19 Jun 2025 07:32:51 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::9ca8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd095ca02bsm243696d6.125.2025.06.19.07.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:32:50 -0700 (PDT)
Date: Thu, 19 Jun 2025 10:32:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thomas Haas <t.haas@tu-bs.de>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,
	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev, hernan.poncedeleon@huaweicloud.com,
	jonas.oberhauser@huaweicloud.com,
	"r.maseli@tu-bs.de" <r.maseli@tu-bs.de>
Subject: Re: [RFC] Potential problem in qspinlock due to mixed-size accesses
Message-ID: <6ac81900-873e-415e-b5b2-96e9f7689468@rowland.harvard.edu>
References: <cb83e3e4-9e22-4457-bf61-5614cc4396ad@tu-bs.de>
 <20250613075501.GI2273038@noisy.programming.kicks-ass.net>
 <aEwHufdehlQnBX7g@andrea>
 <9264df13-36db-4b25-b2c4-7a9701df2f4d@tu-bs.de>
 <aE-3_mJPjea62anv@andrea>
 <357b3147-22e0-4081-a9ac-524b65251d62@rowland.harvard.edu>
 <aFF3NSJD6PBMAYGY@andrea>
 <595209ed-2074-46da-8f57-be276c2e383b@tu-bs.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <595209ed-2074-46da-8f57-be276c2e383b@tu-bs.de>

On Thu, Jun 19, 2025 at 04:27:56PM +0200, Thomas Haas wrote:
> I support this endeavor, but from the Dartagnan side :).
> We already support MSA in real C/Linux code and so extending our supported
> Litmus fragment to MSA does not sound too hard to me.
> We are just missing a LKMM cat model that supports MSA.

To me, it doesn't feel all that easy.  I'm not even sure where to start 
changing the LKMM.\

Probably the best way to keep things organized would be to begin with 
changes to the informal operational model and then figure out how to 
formalize them.  But what changes are needed to the operational model?

Alan
