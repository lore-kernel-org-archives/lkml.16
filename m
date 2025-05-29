Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE0220299B
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748511555; cv=none; b=EoJ15oOCR02IK8LhBTEfboysOXFLBlqERamPChqQx14Syp4kshDBe/MTA1L9yq37SXeQDzUnNYO2E2NAGs4t5RA/lzhx8i4IMgaja8GHGIyTu36P7Bztn8E+M2M7mmevX2kiDv1tYIygqqVb+DMQj0L8ePihl4xctkU5TJbXtNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748511555; c=relaxed/simple;
	bh=NcB1rzEV/LC56nrPF7lktQVhTrcEpHRzCJxV+HrnzR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oo5LuqrdFV5wTjL1nZSSAmsTzMV8BDbVLrsyUvHIrydK1B9JE6Bc3JaPAnx87zJd9o263bSMbG1/AUF6kW/PsoMnFFaWbvFTtjmU/axNhn/k3XTN293hs/uu5Usp7lUifpFpoAKR4BR+7eqAEgHa1RGZDzyNuCsL4HGrl+bRDPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h/Q25UzI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h/Q25UzI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748511552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3bzsMQRln4zGiQo+xGDA/RvTdDu7XC+7KeR7bWAi7Es=;
	b=h/Q25UzIyDrhJpfXDn3bfQ3fnou9I/C+4XJoe+FfiYdKtGR4LaE4NLqpZkc/tqlTGeZhP1
	SFJdBjvivnZMPGSDK3F0wcT/+lNRRMIzM9B2OGwDF1VK7ndw7qdKZDfNCD0ZoJ7CIKeDQw
	51C1c12gZJ4TdbST9SiZiDbVRBcrrd4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-DLjUOPlfPGi0aEU1XeIBjg-1; Thu, 29 May 2025 05:39:09 -0400
X-MC-Unique: DLjUOPlfPGi0aEU1XeIBjg-1
X-Mimecast-MFC-AGG-ID: DLjUOPlfPGi0aEU1XeIBjg_1748511548
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4d863ac97so293292f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 02:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511548; x=1749116348;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3bzsMQRln4zGiQo+xGDA/RvTdDu7XC+7KeR7bWAi7Es=;
        b=KrXxxqrjLvqbo1KkQA4XPQBszDzJ7NkyYyQztI8QVp1iLj7pDy4yM12PvWCuJd3nL1
         33aoo+kvWBQ2UUb6OH1p2DJBkuNUQMGL8BamlQd65obAVjKN1jwWTfZVQY7aOjqehoQo
         b41M7RhO9qwC/sw0ggsoQjNQnjy+TfqYwQ1Wnl8m3Qq+nhLUmA40hj1FVK9dAL1N25q0
         3s6QMzR0N+r65eiWojY28xM7axe+72bWPVjQ+Edr+FZ3CyfqPKvqXyJYfKo+e3JX+5qY
         3IB7BX/D2YLhtigeP4bqVhEbqkjOOupmi4CKpuim2dUIKkGbw2DEZ7qc/IpSro9l6nke
         mr0g==
X-Forwarded-Encrypted: i=1; AJvYcCX9jkAFpMunfblX+1iMpIAZGxmOPNleOfGcmn/sBfudDznDqlqKU6O0+IVB25Equu6eSa5PNNfBn9SUwe4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj0MQKYCLmDL8W0ah2/32Z9U99dBR7j+Ln8rDtk+QLLDo6bEMq
	u30joPA+QbLr489QCgfjDAdXKgvNsurThZw3/jsNTJWH5mkEGENIo2N4fQWIvFHz6YsTo+GcSmP
	MI+iGgpCOhHvd3DPO9DIoRt97S10DFNIl6zwTvb6x+X64hdqeKTBM9+Ks9kuL9DCI+w==
X-Gm-Gg: ASbGncso0+t8Sku5xUuUQSQR2qzIMsCY/+fCzKcPDDj0BW39tHiZlZAnlIhPTyh6qa0
	d3RAJh8mc37M7lDIzcIKbBsjsD5ub5MDIf5Y70s6kwQVSZ8jLE5dGPns/8k4fgXwR7Ad//4CDyX
	QdJfUmHPdJSBY2fNd/gQjjW7UUIMmI100PrlrRQv90CjS/5CxwmD1RfMmz0J+3NG5WfytkySGGs
	ZW9VEqzQ2TbvGGexDctKDdMZsrAphrMb5Wnj2EXRxn/cbki5qntF3WsMzpZocZ8MLMR3TuHJMre
	Acp3ETUuWBK5uemEKCCAxVqkvhwwoFhZRnFcZpArpg==
X-Received: by 2002:a05:6000:40c7:b0:3a4:dc42:a0af with SMTP id ffacd0b85a97d-3a4f35bdfddmr1121089f8f.33.1748511548244;
        Thu, 29 May 2025 02:39:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH44qFgbShQbtOxlRHWwhiVJrhJhHTGF2wf1lW/ldZC++p9bKXnZXnjVdcTEuMSKEonNwJX5A==
X-Received: by 2002:a05:6000:40c7:b0:3a4:dc42:a0af with SMTP id ffacd0b85a97d-3a4f35bdfddmr1121064f8f.33.1748511547684;
        Thu, 29 May 2025 02:39:07 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.57.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b8b3sm1440566f8f.20.2025.05.29.02.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 02:39:06 -0700 (PDT)
Date: Thu, 29 May 2025 11:39:05 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
Cc: luca abeni <luca.abeni@santannapisa.it>, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vineeth Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <aDgrOWgYKb1_xMT6@jlelli-thinkpadt14gen4.remote.csb>
References: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
 <aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
 <f532441d8b3cf35e7058305fd9cd3f2cbd3a9fac.camel@codethink.co.uk>
 <20250507222549.183e0b4a@nowhere>
 <92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
 <20250523214603.043833e3@nowhere>
 <c91a117401225290fbf0390f2ce78c3e0fb3b2d5.camel@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="YgEMRRdxdGgCJjyO"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c91a117401225290fbf0390f2ce78c3e0fb3b2d5.camel@codethink.co.uk>


--YgEMRRdxdGgCJjyO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Marcel,

On 25/05/25 21:29, Marcel Ziswiler wrote:
> Hi Luca
> 
> On Fri, 2025-05-23 at 21:46 +0200, luca abeni wrote:
> > Hi Marcel,
> > 
> > sorry, but I have some additional questions to fully understand your
> > setup...
> 
> No Problem, I am happy to answer any questions :)
> 
> > On Mon, 19 May 2025 15:32:27 +0200
> > Marcel Ziswiler <marcel.ziswiler@codethink.co.uk> wrote:
> > [...]
> > > > just a quick question to better understand your setup (and check
> > > > where the issue comes from):
> > > > in the email below, you say that tasks are statically assigned to
> > > > cores; how did you do this? Did you use isolated cpusets,  
> > > 
> > > Yes, we use the cpuset controller from the cgroup-v2 APIs in the
> > > linux kernel in order to partition CPUs and memory nodes. In detail,
> > > we use the AllowedCPUs and AllowedMemoryNodes in systemd's slice
> > > configurations.
> > 
> > How do you configure systemd? I am having troubles in reproducing your
> > AllowedCPUs configuration... This is an example of what I am trying:
> > 	sudo systemctl set-property --runtime custom-workload.slice AllowedCPUs=1
> > 	sudo systemctl set-property --runtime init.scope AllowedCPUs=0,2,3
> > 	sudo systemctl set-property --runtime system.slice AllowedCPUs=0,2,3
> > 	sudo systemctl set-property --runtime user.slice AllowedCPUs=0,2,3
> > and then I try to run a SCHED_DEADLINE application with
> > 	sudo systemd-run --scope -p Slice=custom-workload.slice <application>
> 
> We just use a bunch of systemd configuration files as follows:
> 

...

> > How are you configuring the cpusets?
> 
> See above.
> 

Could you please add 'debug sched_debug sched_verbose' to your kernel
cmdline and share the complete dmesg before starting your tests?

Also, I am attaching a script that should be able to retrieve cpuset
information if you run it with

# python3 get_cpuset_info.py > cpuset.out

Could you please also do that and share the collected information?

It should help us to better understand your setup and possibly reproduce
the problem you are seeing.

Thanks!
Juri

--YgEMRRdxdGgCJjyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=get_cpuset_info.py

import os

def get_cpuset_info(cgroup_path):
    """Retrieves cpuset information for a given cgroup path."""
    info = {}
    files_to_check = [
        'cpuset.cpus',
        'cpuset.mems',
        'cpuset.cpus.effective',
        'cpuset.mems.effective',
        'cpuset.cpus.exclusive',
        'cpuset.cpus.exclusive.effective',
        'cpuset.cpus.partition'
    ]

    for filename in files_to_check:
        filepath = os.path.join(cgroup_path, filename)
        if os.path.exists(filepath) and os.access(filepath, os.R_OK):
            try:
                with open(filepath, 'r') as f:
                    info[filename] = f.read().strip()
            except Exception as e:
                info[filename] = f"Error reading: {e}"
        # else:
        #     info[filename] = "Not found or not readable" # Uncomment if you want to explicitly show missing files
    return info

def main():
    cgroup_root = '/sys/fs/cgroup'

    print(f"Recursively retrieving cpuset information from {cgroup_root} (cgroup v2):\n")

    for dirpath, dirnames, filenames in os.walk(cgroup_root):
        # Skip the root cgroup directory itself if it's not a delegate
        # and only process subdirectories that might have cpuset info.
        # This is a heuristic; if you want to see info for the root too, remove this if.
        # if dirpath == cgroup_root:
        #     continue

        cpuset_info = get_cpuset_info(dirpath)

        if cpuset_info: # Only print if we found some cpuset information
            print(f"Cgroup: {dirpath.replace(cgroup_root, '') or '/'}")
            for key, value in cpuset_info.items():
                print(f"  {key}: {value}")
            print("-" * 30) # Separator for readability

if __name__ == "__main__":
    main()

--YgEMRRdxdGgCJjyO--

