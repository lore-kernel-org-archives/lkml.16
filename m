Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F4C21CA0D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049928; cv=none; b=nAjWQRc6zdaqpV5isWU89KFrJeFMt7FOEAkrLUXFAHg5MepJjlVEcQ4sUhR10NVmExLgv5KCAuwT3NVlNsOGBtqExXCBGLynfdS+XPs6XmgQ1O3ShtonS5/lJ9wgej42KaLRn5Q/PXQt1EU08UXIhDd0xzUcexkXy+vs04ARmcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049928; c=relaxed/simple;
	bh=ZF42jBZwi4dUSiyBs4Y9tJOjXavkr3L3giGFfMbphEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkRWT3XDcAsW881yUaIql4sYj3VrnTBBykqPpevsOOmQ9oYZecLnBsreRFIHjVteUSiyMD4sl6fH70KsaHEsahzw2GlFkVrzlqubNImhouQAqXgNiYXCeP1U9qHzp1WJwwgq3uunP/vZBeYbysBHmBY4fwMFTXDoOgs/130E5tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g+eQSuql; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g+eQSuql"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2240aad70f2so34015ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 11:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744049926; x=1744654726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MFbNZd4DwARKKfdWQ+Cu/tmGujuqrB3Wcc2GX+USUd0=;
        b=g+eQSuqldQRevWblw93blLcukQKl4ufF1jC1PLGB/8rrw8tWdQAnYAbn/PiJQbY0Xu
         VdAwF8B96dmz2wBjN0L/OtkRL7vr/wXRWiDDvG43R1aAxyfx08cGfoXOYMAIvjes6fSf
         vJ3Dn9J8HtRfE+KwqyLD8myxtfK0R9W7yxJZa/zG7+ogSLs6REu1iMKRJOEoQzjko862
         6lYPlldP5pGU7PJfqvlQ4Fnm2+m2JmrHzFMNjJjLMEZAkas3+K/O63RZ9qKgRxsENojo
         hjoPJgDyQlg5dAWzMKo6G/3bbQY9gf1MtwDo55kg0VQZA82H/3WqvdNx0xULv688Ay8t
         hP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049926; x=1744654726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFbNZd4DwARKKfdWQ+Cu/tmGujuqrB3Wcc2GX+USUd0=;
        b=JLkXbruzfggxA9wHZOfW8ty8w8P/ZzyLIDgGraKcRtk5+SHHg7Shz59SNbFOl8W6g4
         HueJ8SMLeculVw7AIov1CYxaGiNF+mgTw/Of4JSXQkznFdF/Tp2F3OfdH9rEf4chfR8k
         HZtBtsgE7Yc6wwaWQpFkrz9ibSbKRDAuhFSl7DItjSK4FuCUjkYC5wqWWaCdL582a7Fj
         DhUTpjal5EHLX0WjAzyl4lXatOAkM06Lp8auVdgUQh0dmLOrZmVNOFCvsRDLtTFfOgmA
         soG84+tuZ/UOaJBIyh4iGqOhir3EIsxJQbxHgl6VSF5dXT50QNcxxqbtdJYRelUKcXwK
         yxxA==
X-Forwarded-Encrypted: i=1; AJvYcCXjTawLsQtUU0ghK9aWziEQ5Edzy5L5DLcMVMcPT9rD7A0NBbMCdefcuXePV2LAQ14eKmkJwEuur5aiQW0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv1opA0gGbgDyq/VtDphPbI6g9RiBEROF0A6gTqBgzWIYZEuv0
	6iymRMgzCIHrMxSO/OFPN1I+QSr+oqA2rCgtyoyjotDO8WyE5Qxc711iORanNg==
X-Gm-Gg: ASbGncskF7dj15f4JdiXx4i/3uK4D2rFLOvj5b7xx1VZpu6pLapXuKCI5wLSddjtktV
	PVdXv1URGEVmxei5Hto15WHXQcCaUvcb76F7GOzsYQ31cGSBtsWrMtthq8EsYgIgtX5eD0oTQxX
	AdMvA9IP1uyjijnFUAedQyEgCLyzo7LoMn9I4PWrhlq76SJYdDuLbcOeA6zRrrId0nfwCTTY4lq
	4k5GdfmKC+5y8Snmpo8EqGbrhh/itpgtrxAVC3bHNZeJtRHCy8KcB0QartaWzRKCBMCxjJLYYe2
	sgtStArlZBw8IOaZ15MZcpT1RHZQHyVy0gKpDhO1m19TyYKh5xk5O1TAdK168RtryapC8rDIRKN
	rQZLp
X-Google-Smtp-Source: AGHT+IGln/Izgg3nWrLuWhL1QVjnKuf8O6IzSSF669Fhi9ozJGHYGsvvwP2dWH2ZoxjYcV7iVO8o8A==
X-Received: by 2002:a17:902:6b0c:b0:215:86bf:7e46 with SMTP id d9443c01a7336-22ab69e49ffmr102315ad.7.1744049925946;
        Mon, 07 Apr 2025 11:18:45 -0700 (PDT)
Received: from google.com (24.21.230.35.bc.googleusercontent.com. [35.230.21.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305827d70a4sm9243096a91.3.2025.04.07.11.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 11:18:45 -0700 (PDT)
Date: Mon, 7 Apr 2025 11:18:40 -0700
From: Igor Pylypiv <ipylypiv@google.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ata: libata-scsi: Set INFORMATION sense data field
 consistently
Message-ID: <Z_QXAA5Mq1kFP4Ao@google.com>
References: <20250403212924.306782-1-ipylypiv@google.com>
 <Z-_JExGDyO9pVTON@ryzen>
 <Z_AweMPLRJgBIBF3@google.com>
 <Z_OSQzA04-5v7SR0@ryzen>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_OSQzA04-5v7SR0@ryzen>

On Mon, Apr 07, 2025 at 10:52:19AM +0200, Niklas Cassel wrote:
> On Fri, Apr 04, 2025 at 12:18:16PM -0700, Igor Pylypiv wrote:
> > 
> > Agree. ATA Status Return sense data descriptor for ATA PASS-THOUGH commands
> > already contains the ATA LBA in bytes [6..11] so it seems redundant to
> > also include the same in the Information sense data descriptor.   
> 
> Damien and I talked about this.
> 
> Since this patch only affects non-PT commands, what it this patch actually
> solving?

For ATA PASS-THROUGH + fixed format sense data + NCQ autosense, this patch
eliminates reduntant writes to set the INFORMATION field and the VALID bit.

First write: scsi_set_sense_information() sets the INFORMATION field
to ATA LBA (which is incorrect for ATA PASS-THROUGH).

Second write: ata_scsi_set_passthru_sense_fields() sets the INFORMATION
field to ATA ERROR/STATUS/DEVICE/COUNT(7:0) as per SAT spec.

User space should not see an issue because second write overwrites
the incorrect data from the first write. I think we should still fix
this in case someone updates the code to remove the second write in
the future.


How I found this issue?

In commit 38dab832c3f4 (ata: libata-scsi: Fix offsets for the fixed format
sense data) the offsets of fixed format sense data were updated to match 
the SAT spec. To simplify the migration from old incorrect offsets to
the new correct offsets I was considering using the VALID bit to determine
what offsets to use in user space during the migration. The problem is that
for ATA PASS-THROUGH + fixed format sense data + NCQ autosense the VALID bit
is also being set by the scsi_set_sense_information() so we cannot use
the VALID bit to reliably determine if kernel uses the correct fixed sense
data offsets or not.

> 
> Since for non-PT commands, sense data is not returned to the user.
> 
> So unless SCSI core does some specific handling based on the INFORMATION
> field (and AFAICT, SCSI core only looks at SK/ASC/ASCQ), I can't see how
> this patch can actually solve anything.

+1 the patch does not seem to solve any issues for non-PT commands besides
a spec compliance which is not visible to a user.

Deleting ata_scsi_set_sense_information() should work as well. If SCSI core
does not use the INFORMATION field perhaps there is no need to set it at all?
This will eliminate the reduntant writes for ATA PASS-THROUGH as well.


Thanks,
Igor

> 
> 
> Kind regards,
> Niklas
